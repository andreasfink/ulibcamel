//
//  UMLayerCamel.m
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMLayerCamel.h>

#import <ulibcamel/UMCamelDialogIdentifier.h>
#import <ulibcamel/UMCamelUserProtocol.h>
#import <ulibcamel/UMCamelDialog.h>
#import <ulibcamel/UMCamelErrorCode.h>
#import <ulibcamel/UMCamel_InitialDPArg.h>
#import <ulibcamel/UMCamel_ConnectArg.h>
#import <ulibcamel/UMCamelObject.h>

@implementation UMLayerCamel


//* INIT:   create _dialogIdLock , _dialogs*/
//dialogTimeout=120


- (UMLayerCamel *)initWithoutExecutionQueue:(NSString *)name
{
    self = [super initWithoutExecutionQueue:name];
    if(self)
    {
        //[self genericInitialisation];
    }
    return self;
}


- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_InternalOperation)operationType
               operationName:(NSString *__autoreleasing *)xoperationName
                     context:(id)context
{
    UMASN1Object *o;
    if(params)
    {
        UMCamelObject *asn1 = [[UMCamelObject alloc]initWithASN1Object:params context:context];
        NSString *name = NULL;
        o = [asn1 decodeASN1:params
               operationCode:opcode
               operationType:operationType
               operationName:&name
                     context:context];
    }
    else
    {
        o = NULL;
    }
    return o;
}

- (NSString *)decodeError:(int)err
{
    return @"error";
}

- (UMCamelDialogIdentifier *)getNewUserDialogId
{

    static int64_t lastDialogId =1;
    int64_t did;
    [_dialogIdLock lock];
    lastDialogId = (lastDialogId + 1 ) % 0x7FFFFFFF;
    did = lastDialogId;
    [_dialogIdLock unlock];
    return [[UMCamelDialogIdentifier alloc]initWithString: [NSString stringWithFormat:@"C%08llX",(long long)did]];
}


- (UMCamelDialog *)dialogById:(UMCamelDialogIdentifier *)did
{
    return _dialogs[did.description];
}

- (void)tcapBeginIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
          tcapTransactionId:(NSString *)localTransactionId
    tcapRemoteTransactionId:(NSString *)remoteTransactionId
                    variant:(UMTCAP_Variant)var
             callingAddress:(SccpAddress *)src
              calledAddress:(SccpAddress *)dst
            dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               callingLayer:(UMLayerTCAP *)tcapLayer
                 components:(NSArray<UMTCAP_generic_asn1_componentPDU *> *)components
                    options:(NSDictionary *)options
{
    UMCamelDialogIdentifier *dialogId = [[UMCamelDialogIdentifier alloc]initWithTcapUserDialogIdentifier:userDialogId];
    
    UMCamelDialog* dialog = [self getNewDialogForUser:_user withId:dialogId];
    
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self.logFeed debugText:[NSString stringWithFormat:@"tcapBeginIndication creates a new dialogId: %@\n",dialog.userDialogId]];
    }

    /* FIXME: open indication */
    if(dialog.tcapLocalTransactionId == NULL)
    {
        dialog.tcapLocalTransactionId = localTransactionId;
    }
    if(dialog.tcapRemoteTransactionId==NULL)
    {
        dialog.tcapRemoteTransactionId = remoteTransactionId;
    }
    
    /* FIXME component processing */
    [dialog CAMEL_ProcessComponents:components
                          options:options
                          willEnd:NO];
    [dialog CAMEL_Delimiter_Ind:options
                       dialog:dialogId
               callingAddress:src
                calledAddress:dst
              dialoguePortion:xdialoguePortion
                transactionId:localTransactionId
          remoteTransactionId:remoteTransactionId];
    if(components.count==0)
    {
        UMTCAP_asn1_Associate_result *r = [[UMTCAP_asn1_Associate_result alloc]initWithValue:0];
        UMTCAP_asn1_Associate_source_diagnostic *d = [[UMTCAP_asn1_Associate_source_diagnostic alloc]init];
        d.dialogue_service_user =[[UMASN1Integer alloc]initWithValue:0];
        [dialog CAMEL_Delimiter_Req:options
                     callingAddress:dst
                      calledAddress:src
                             result:r
                         diagnostic:d
                           userInfo:NULL];
    }
}

- (void)tcapContinueIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
             tcapTransactionId:(NSString *)xlocalTransactionId
       tcapRemoteTransactionId:(NSString *)xremoteTransactionId
                       variant:(UMTCAP_Variant)var
                callingAddress:(SccpAddress *)src
                 calledAddress:(SccpAddress *)dst
               dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                  callingLayer:(UMLayerTCAP *)tcapLayer
                    components:(NSArray<UMTCAP_generic_asn1_componentPDU *> *)components
                       options:(NSDictionary *)options
{
    UMCamelDialogIdentifier *dialogId = [[UMCamelDialogIdentifier alloc]initWithTcapUserDialogIdentifier:tcapUserId];
    UMCamelDialog *dialog = [self dialogById:dialogId];
    
    if((dialog==NULL) && (options[@"injected"]))
    {
        /*  if we are using sccp injecting into the stack to debug
         decoding incoming packets, then we might not have a previous transaction.
         For example if we submit a sccp pdu with tcapContinue without previous tcapBegin.
         In this case we enfore to decode it anyway by creating the missing transaction on the fly
         so the decoding runs through.
         */
        if(dialogId)
        {
            dialog = [self getNewDialogForUser:_user withId:dialogId];
        }
        else
        {
            dialog = [self getNewDialogForUser:_user];
        }
        [dialog CAMEL_Open_Ind_forUser:_user
                                  tcap:tcapLayer
                                   map:self
                               variant:var
                        callingAddress:src
                         calledAddress:dst
                       dialoguePortion:xdialoguePortion
                         transactionId:xlocalTransactionId
                   remoteTransactionId:xremoteTransactionId
                               options:options];
        dialogId = dialog.userDialogId;
    }
    if(dialog==NULL)
    {
        [self.logFeed minorErrorText:[NSString stringWithFormat:@"tcapContinueIndication: DialogNotFound %@ for transaction [local %@ remote %@]",dialogId,xlocalTransactionId,xremoteTransactionId]];
        return;
    }
    else
    {
        if(self.logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"tcapContinueIndication\n"
                           @"    dialogId: %@\n"
                           @"    localTransactionId: %@\n"
                           @"    remoteTransactionId: %@\n"
                           @"    userIdentifier: %@\n",
                           dialog.userDialogId,
                           dialog.tcapLocalTransactionId,
                           dialog.tcapRemoteTransactionId,
                           dialog.userIdentifier];
            [self.logFeed debugText:s];
        }
        if(dialog.tcapLocalTransactionId == NULL)
        {
            dialog.tcapLocalTransactionId = xlocalTransactionId;
        }
        if(dialog.tcapRemoteTransactionId == NULL)
        {
            dialog.tcapRemoteTransactionId = xremoteTransactionId;
        }
        /* we must set local addresses/remote addresses here because when processing components this info might already be needed */
        if(dialog.tcapContinueSeen == NO)
        {
            /* this is the first tcap continue so we take over the remote address for it */
            /* update the GT's based on the response but keep the translation types */
            int tt = dialog.remoteAddress.tt.tt;
            dialog.remoteAddress = src;
            dialog.remoteAddress.tt.tt = tt;
            
            tt = dialog.localAddress.tt.tt;
            dialog.localAddress = dst;
            dialog.localAddress.tt.tt = tt;
            
            dialog.tcapContinueSeen=YES;
        }
        [dialog CAMEL_ProcessComponents:components
                              options:options
                              willEnd:NO];
        [dialog CAMEL_Delimiter_Ind:options
                           dialog:dialogId
                   callingAddress:src
                    calledAddress:dst
                  dialoguePortion:xdialoguePortion
                    transactionId:xlocalTransactionId
              remoteTransactionId:xremoteTransactionId];
        
        [dialog CAMEL_Continue_Ind:options
                  callingAddress:src
                   calledAddress:dst
                 dialoguePortion:xdialoguePortion
                   transactionId:xlocalTransactionId
             remoteTransactionId:xremoteTransactionId];
    }
}

- (void)tcapEndIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
        tcapTransactionId:(NSString *)localTransactionId
  tcapRemoteTransactionId:(NSString *)remoteTransactionId
                  variant:(UMTCAP_Variant)var
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
          dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
             callingLayer:(UMLayerTCAP *)tcapLayer
               components:(NSArray<UMTCAP_generic_asn1_componentPDU *> *)components
                  options:(NSDictionary *)options
{
    UMCamelDialogIdentifier *dialogId = [[UMCamelDialogIdentifier alloc]initWithTcapUserDialogIdentifier:tcapUserId];
    
    UMCamelDialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [self.logFeed minorErrorText:[NSString stringWithFormat:@"tcapEndIndication: DialogNotFound %@ for transaction [local %@ remote %@]",dialogId,localTransactionId,remoteTransactionId]];
        return;
    }
    else
    {
        if(self.logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"tcapEndIndication\n"
                           @"    dialogId: %@\n"
                           @"    localTransactionId: %@\n"
                           @"    remoteTransactionId: %@\n"
                           @"    userIdentifier: %@\n",
                           dialog.userDialogId,
                           dialog.tcapLocalTransactionId,
                           dialog.tcapRemoteTransactionId,
                           dialog.userIdentifier];
            [self.logFeed debugText:s];
        }
        if(dialog.tcapLocalTransactionId == NULL)
        {
            dialog.tcapLocalTransactionId = localTransactionId;
        }
        if(dialog.tcapRemoteTransactionId == NULL)
        {
            dialog.tcapRemoteTransactionId = remoteTransactionId;
        }
        dialog.remoteAddress = src;
        dialog.localAddress = dst;
        
        @try
        {
           [dialog CAMEL_ProcessComponents:components
                                   options:options
                                   willEnd:YES];
        }
        @catch(NSException *ex)
        {
            [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
        @try
        {
           [dialog CAMEL_Close_Ind:options];
        }
        @catch(NSException *ex)
        {
            [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
    }
}

- (void)tcapNoticeIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayerTCAP *)tcapLayer
                  components:(NSArray<UMTCAP_generic_asn1_componentPDU *> *)components
                      reason:(SCCP_ReturnCause)reason
                     options:(NSDictionary *)options
{
    UMCamelDialogIdentifier *dialogId =   [[UMCamelDialogIdentifier alloc] initWithTcapUserDialogIdentifier:tcapUserId];
    UMCamelDialog *dialog = [self dialogById:dialogId];
    [dialog CAMEL_Notice_Ind:options
           tcapTransactionId:localTransactionId
                      reason:reason];
}

- (void)tcapPAbortIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayerTCAP *)tcapLayer
                        asn1:(UMASN1Object *)asn1
                     options:(NSDictionary *)options
{
    UMCamelDialogIdentifier *dialogId =   [[UMCamelDialogIdentifier alloc] initWithTcapUserDialogIdentifier:tcapUserId];
    
    if(self.logLevel <=UMLOG_DEBUG)
    {
        [self.logFeed debugText:[NSString stringWithFormat:@"tcapPAbortIndication for dialog %@",dialogId]];
    }
    UMCamelDialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [self.logFeed minorErrorText:[NSString stringWithFormat:@"tcapPAbortIndication: Dialog %@ not found for transaction [local %@ remote %@]",dialogId,localTransactionId,remoteTransactionId]];
        return;
    }
    
    dialog.tcapLocalTransactionId = localTransactionId;
    
    @try
    {
        [dialog CAMEL_P_Abort_Ind:options
                   callingAddress:src
                    calledAddress:dst
                  dialoguePortion:xdialoguePortion
                    transactionId:localTransactionId
              remoteTransactionId:remoteTransactionId];
        
        /* this is an implicit close */
    }
    @catch(NSException *ex)
    {
        [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}

- (void)tcapUAbortIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayerTCAP *)tcapLayer
                        asn1:(UMASN1Object *)asn1
                     options:(NSDictionary *)options
{
    UMCamelDialogIdentifier *dialogId =   [[UMCamelDialogIdentifier alloc] initWithTcapUserDialogIdentifier:tcapUserId];
    
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self.logFeed debugText:@"tcapUAbortIndication received"];
    }
    UMCamelDialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [self.logFeed minorErrorText:[NSString stringWithFormat:@"tcapUAbortIndication: Dialog %@ not found for transaction [local %@ remote %@]",tcapUserId,localTransactionId,remoteTransactionId]];
        return;
    }
    
    dialog.tcapLocalTransactionId = localTransactionId;
    @try
    {
        [dialog CAMEL_U_Abort_Ind:options
                 callingAddress:src
                  calledAddress:dst
                dialoguePortion:xdialoguePortion
                  transactionId:localTransactionId
            remoteTransactionId:remoteTransactionId];
    }
    @catch(NSException *ex)
    {
        [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
    @try
    {
        [dialog CAMEL_Close_Ind:options];
    }
    @catch(NSException *ex)
    {
        [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}

- (void)tcapUnidirectionalIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
                   tcapTransactionId:(NSString *)localTransactionId
             tcapRemoteTransactionId:(NSString *)remoteTransactionId
                             variant:(UMTCAP_Variant)variant
                      callingAddress:(SccpAddress *)src
                       calledAddress:(SccpAddress *)dst
                     dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                        callingLayer:(UMLayerTCAP *)tcapLayer
                          components:(NSArray<UMTCAP_generic_asn1_componentPDU *> *)components
                             options:(NSDictionary *)options
{
    //UMCamelDialogIdentifier *dialogId =   [[UMCamelDialogIdentifier alloc] initWithTcapUserDialogIdentifier:tcapUserId];
    
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self.logFeed debugText:@"tcapUnidirectionalIndication received"];
    }
    
    @try
    {/*
        [user queueMAP_Unidirectional_Ind:options
                           callingAddress:src
                            calledAddress:dst
                          dialoguePortion:xdialoguePortion
                            transactionId:localTransactionId
                      remoteTransactionId:remoteTransactionId];
      */
    }
    @catch(NSException *ex)
    {
        [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}


- (UMCamelDialog *)getNewDialogForUser:(id<UMCamelUserProtocol>)user
{
    UMCamelDialogIdentifier *dialogId  = [self getNewUserDialogId];
    UMCamelDialog *d = [self getNewDialogForUser:user withId:dialogId];
    return d;
}

- (UMCamelDialog *)getNewDialogForUser:(id<UMCamelUserProtocol>)u
                                withId:(UMCamelDialogIdentifier *)dialogId
{
    UMCamelDialog *d = [[UMCamelDialog alloc]init];
    d.userDialogId = dialogId;
    d.tcapLayer = _tcap;
    d.camelLayer = self;
    d.camelUser = u;
    d.logFeed = self.logFeed;
    d.logLevel = self.logLevel;
    if(self.dialogTimeout > 0.0)
    {
        d.timeoutInSeconds = self.dialogTimeout;
    }
    _dialogs[d.userDialogId.description] = d;
    [d touch];
    return d;
}

+ (NSString *)decodeError:(int)err
{
    switch(err)
    {
        case UMCamelErrorCode_canceled:
            return @"canceled";
        case UMCamelErrorCode_cancelFailed:
            return @"cancelFailed";
        case UMCamelErrorCode_eTCFailed:
            return @"eTCFailed";
        case UMCamelErrorCode_improperCallerResponse:
            return @"improperCallerResponse";
        case UMCamelErrorCode_missingCustomerRecord:
            return @"missingCustomerRecord";
        case UMCamelErrorCode_parameterOutOfRange:
            return @"parameterOutOfRange";
        case UMCamelErrorCode_requestedInfoError:
            return @"requestedInfoError";
        case UMCamelErrorCode_systemFailure:
            return @"systemFailure";
        case UMCamelErrorCode_taskRefused:
            return @"taskRefused";
        case UMCamelErrorCode_unavailableResource:
            return @"unavailableResource";
        case UMCamelErrorCode_unexpectedComponentSequence:
            return @"unexpectedComponentSequence";
        case UMCamelErrorCode_unexpectedDataValue:
            return @"unexpectedDataValue";
        case UMCamelErrorCode_unexpectedParameter:
            return @"unexpectedParameter";
        case UMCamelErrorCode_unknownLegID:
            return @"unknownLegID";
        case UMCamelErrorCode_unknownPDPID:
            return @"unknownPDPID";
        case UMCamelErrorCode_unknownCSID:
            return @"unknownCSID";
    }
    return [NSString stringWithFormat:@"unknown-error(%d)",err];
}


+(UMASN1Object *)decodeAsn1:(UMASN1Object *)asn1
{
    return [[UMCamelObject alloc]initWithASN1Object:asn1 context:NULL];
}

- (NSString *)status
{
    return @"not-implemented";
}


- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMLayerCamelApplicationContextProtocol>)appContext
{
    [self readLayerConfig:cfg];
    if (cfg[@"address"])
    {
        _address =  [cfg[@"address"] stringValue];
    }
    if (cfg[@"timeout"])
    {
        _timeout = [cfg[@"timeout"] doubleValue];
    }
    else
    {
        _timeout = 70;
    }
}

- (void)startUp
{
    
}
@end
