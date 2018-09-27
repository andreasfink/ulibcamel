//
//  UMLayerCamel.m
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMLayerCamel.h"

#import "UMCamelDialogIdentifier.h"
#import "UMCamelUserProtocol.h"

@implementation UMLayerCamel


//* INIT:   create _dialogIdLock , _dialogs*/

- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_InternalOperation)operation
               operationName:(NSString *__autoreleasing *)xoperationName
                     context:(id)context
{
    return NULL;
}

- (NSString *)decodeError:(int)err
{
    return @"error";
}

- (UMTCAP_UserDialogIdentifier *)getNewUserDialogId
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
    
    if(logLevel <= UMLOG_DEBUG)
    {
        [logFeed debugText:[NSString stringWithFormat:@"tcapBeginIndication creates a new dialogId: %@\n",dialog.userDialogId]];
    }
    [dialog MAP_Open_Ind_forUser:user
                            tcap:tcapLayer
                             map:self
                         variant:var
                  callingAddress:src
                   calledAddress:dst
                 dialoguePortion:xdialoguePortion
                   transactionId:localTransactionId
             remoteTransactionId:remoteTransactionId
                         options:options];
    if(dialog.tcapTransactionId == NULL)
    {
        dialog.tcapTransactionId = localTransactionId;
    }
    if(dialog.tcapRemoteTransactionId==NULL)
    {
        dialog.tcapRemoteTransactionId = remoteTransactionId;
    }
    [dialog MAP_ProcessComponents:components
                          options:options
                          willEnd:NO];
    [dialog MAP_Delimiter_Ind:options
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
        [dialog MAP_Delimiter_Req:options
                           result:r
                       diagnostic:d];
    }
}

- (void)tcapContinueIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
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
            dialog = [self getNewDialogForUser:user withId:dialogId];
        }
        else
        {
            dialog = [self getNewDialogForUser:user];
        }
        [dialog MAP_Open_Ind_forUser:user
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
        [logFeed minorErrorText:[NSString stringWithFormat:@"tcapContinueIndication: DialogNotFound %@ for transaction [local %@ remote %@]",dialogId,xlocalTransactionId,xremoteTransactionId]];
        return;
    }
    else
    {
        if(logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"tcapContinueIndication\n"
                           @"    dialogId: %@\n"
                           @"    localTransactionId: %@\n"
                           @"    remoteTransactionId: %@\n"
                           @"    userIdentifier: %@\n",
                           dialog.userDialogId,
                           dialog.tcapTransactionId,
                           dialog.tcapRemoteTransactionId,
                           dialog.userIdentifier];
            [logFeed debugText:s];
        }
        if(dialog.tcapTransactionId == NULL)
        {
            dialog.tcapTransactionId = xlocalTransactionId;
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
        [dialog MAP_ProcessComponents:components
                              options:options
                              willEnd:NO];
        [dialog MAP_Delimiter_Ind:options
                           dialog:dialogId
                   callingAddress:src
                    calledAddress:dst
                  dialoguePortion:xdialoguePortion
                    transactionId:xlocalTransactionId
              remoteTransactionId:xremoteTransactionId];
        
        [dialog MAP_Continue_Ind:options
                  callingAddress:src
                   calledAddress:dst
                 dialoguePortion:xdialoguePortion
                   transactionId:xlocalTransactionId
             remoteTransactionId:xremoteTransactionId];
    }
}

- (void)tcapEndIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
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
        [logFeed minorErrorText:[NSString stringWithFormat:@"tcapEndIndication: DialogNotFound %@ for transaction [local %@ remote %@]",dialogId,transactionId,remoteTransactionId]];
        return;
    }
    else
    {
        if(logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"tcapEndIndication\n"
                           @"    dialogId: %@\n"
                           @"    localTransactionId: %@\n"
                           @"    remoteTransactionId: %@\n"
                           @"    userIdentifier: %@\n",
                           dialog.userDialogId,
                           dialog.tcapTransactionId,
                           dialog.tcapRemoteTransactionId,
                           dialog.userIdentifier];
            [logFeed debugText:s];
        }
        if(dialog.tcapTransactionId == NULL)
        {
            dialog.tcapTransactionId = transactionId;
        }
        if(dialog.tcapRemoteTransactionId == NULL)
        {
            dialog.tcapRemoteTransactionId = remoteTransactionId;
        }
        dialog.remoteAddress = src;
        dialog.localAddress = dst;
        
        @try
        {
            [dialog MAP_ProcessComponents:components
                                  options:options
                                  willEnd:YES];
        }
        @catch(NSException *ex)
        {
            [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
        @try
        {
            [dialog MAP_Close_Ind:options];
        }
        @catch(NSException *ex)
        {
            [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
    }
}

- (void)tcapNoticeIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
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
    
    [dialog MAP_Notice_Ind:options
         tcapTransactionId:localTransactionId
                    reason:reason];
}

- (void)tcapPAbortIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
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
    
    if(logLevel <=UMLOG_DEBUG)
    {
        [logFeed debugText:[NSString stringWithFormat:@"tcapPAbortIndication for dialog %@",dialogId]];
    }
    UMCamelDialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"tcapPAbortIndication: Dialog %@ not found for transaction [local %@ remote %@]",dialogId,localTransactionId,remoteTransactionId]];
        return;
    }
    
    dialog.tcapTransactionId = localTransactionId;
    
    @try
    {
        [dialog MAP_P_Abort_Ind:options
                 callingAddress:src
                  calledAddress:dst
                dialoguePortion:xdialoguePortion
                  transactionId:localTransactionId
            remoteTransactionId:remoteTransactionId];
        /* this is an implicit close */
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}

- (void)tcapUAbortIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
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
    
    if(logLevel <= UMLOG_DEBUG)
    {
        [logFeed debugText:@"tcapUAbortIndication received"];
    }
    UMCamelDialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"tcapUAbortIndication: Dialog %@ not found for transaction [local %@ remote %@]",tcapUserId,localTransactionId,remoteTransactionId]];
        return;
    }
    
    dialog.tcapTransactionId = localTransactionId;
    @try
    {
        [dialog MAP_U_Abort_Ind:options
                 callingAddress:src
                  calledAddress:dst
                dialoguePortion:xdialoguePortion
                  transactionId:localTransactionId
            remoteTransactionId:remoteTransactionId];
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
    @try
    {
        [dialog MAP_Close_Ind:options];
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}

- (void)tcapUnidirectionalIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
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
    
    if(logLevel <= UMLOG_DEBUG)
    {
        [logFeed debugText:@"tcapUnidirectionalIndication received"];
    }
    
    @try
    {
        [user queueMAP_Unidirectional_Ind:options
                           callingAddress:src
                            calledAddress:dst
                          dialoguePortion:xdialoguePortion
                            transactionId:localTransactionId
                      remoteTransactionId:remoteTransactionId];
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}

- (UMCamelDialog *)getNewDialogForUser:(id<UMCamelUserProtocol>)u withId:(UMCamelDialogIdentifier *)dialogId
{
    UMLayerGSMMAP_Dialog *d = [[UMLayerGSMMAP_Dialog alloc]init];
    d.userDialogId = dialogId;
    d.tcapLayer = tcap;
    d.gsmmapLayer = self;
    d.mapUser = u;
    d.logFeed = self.logFeed;
    d.logLevel = self.logLevel;
    if(self.dialogTimeout > 0.0)
    {
        d.timeoutInSeconds = self.dialogTimeout;
    }
    dialogs[d.userDialogId.description] = d;
    [d touch];
    return d;
}
@end
