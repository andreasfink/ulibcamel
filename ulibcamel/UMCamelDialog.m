//
//  UMCamelDialog.m
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamelDialog.h"
#import "UMLayerCamel.h"

@implementation UMCamelDialog

#pragma mark -
#pragma mark Initialisation


- (NSTimeInterval)timeoutInSeconds
{
    return _timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(NSTimeInterval)to
{
    if(to <= 5.0)
    {
        NSLog(@"CAMEL Dialog Timeout is below 5s. Setting it to 5s");
        to = 5.0;
    }
    else if(to >=120.0)
    {
        NSLog(@"CAMEL Dialog Timeout is above 120s. Setting it to 120s");
        to = 120.0;
    }
    _timeoutInSeconds = to;
}

- (UMCamelDialog *)init
{
    self = [super init];
    if(self)
    {
        _nextInvokeId = 0;
        _pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
        _timeoutInSeconds = 120; /* if everything goes wrong and we dont get any PAbort or End or timeout, we kill it after 2 minutes, just in case */
        _startDate = [NSDate new];
        _lastActivity = [[UMAtomicDate alloc]init];
        _logLevel = UMLOG_MAJOR;
    }
    return self;
}

- (int64_t)nextInvokeId
{
    
    int64_t inv = _nextInvokeId;
    _nextInvokeId++;
    _nextInvokeId = _nextInvokeId % 0xFF;
    return inv;
}

- (void) setThisInvokeId:(int64_t)iid
{
    _nextInvokeId = (iid + 1) % 0xFF;
}

- (UMCamelDialogIdentifier *)getNewUserDialogId
{
    return NULL;
}

- (void)tcapBeginIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
          tcapTransactionId:(NSString *)localTransactionId
    tcapRemoteTransactionId:(NSString *)remoteTransactionId
                    variant:(UMTCAP_Variant)var
             callingAddress:(SccpAddress *)src
              calledAddress:(SccpAddress *)dst
            dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               callingLayer:(UMLayerTCAP *)tcapLayer
                 components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                    options:(NSDictionary *)options
{
    
}

#pragma mark -
#pragma mark Various helper


- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_InternalOperation)operation
               operationName:(NSString **)xoperationName
                     context:(id)context
{
    return NULL;
}

- (NSString *)decodeError:(int)err
{
    return [UMLayerCamel decodeError:err];
    
}

- (void)touch
{
    [_lastActivity touch];
    
}

- (BOOL)isTimedOut
{
    BOOL r = NO;
    NSTimeInterval duration =  [_lastActivity age];
    if(duration > self.timeoutInSeconds)
    {
        r = YES;
    }
    return r;
}


/* --------------------------------------------------------------------------- */
/*  TCAP HANDLING */
/* --------------------------------------------------------------------------- */
#pragma mark -
#pragma mark incoming tcap handling
#pragma mark -


- (void)tcapContinueIndication:(NSString *)userDialogId
             tcapTransactionId:(NSString *)localTransactionId
       tcapRemoteTransactionId:(NSString *)remoteTransactionId
                       variant:(UMTCAP_Variant)var
                callingAddress:(SccpAddress *)src
                 calledAddress:(SccpAddress *)dst
               dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                  callingLayer:(UMLayer *)tcapLayer
                    components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                       options:(NSDictionary *)options
{
    
}

- (void)tcapEndIndication:(NSString *)userDialogId
        tcapTransactionId:(NSString *)localTransactionId
  tcapRemoteTransactionId:(NSString *)remoteTransactionId
                  variant:(UMTCAP_Variant)var
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
          dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
             callingLayer:(UMLayer *)tcapLayer
               components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                  options:(NSDictionary *)options
{
    
}


- (void)tcapUnidirectionalIndication:(NSString *)userDialogId
                   tcapTransactionId:(NSString *)localTransactionId
             tcapRemoteTransactionId:(NSString *)remoteTransactionId
                             variant:(UMTCAP_Variant)variant
                      callingAddress:(SccpAddress *)src
                       calledAddress:(SccpAddress *)dst
                     dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                        callingLayer:(UMLayer *)tcapLayer
                          components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                             options:(NSDictionary *)options
{
    
}


- (void)tcapNoticeIndication:(NSString *)userDialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayer *)tcapLayer
                  components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                      reason:(SCCP_ReturnCause)reason
                     options:(NSDictionary *)options
{
    
}





- (void)tcapPAbortIndication:(NSString *)userDialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayer *)tcapLayer
                        asn1:(UMASN1Object *)asn1
                     options:(NSDictionary *)xoptions
{
    /*
    [mapUser executeMAP_P_Abort_Ind:self.userIdentifier
                     callingAddress:src
                      calledAddress:dst
                    dialoguePortion:NULL
                      transactionId:self.tcapLocalTransactionId
                remoteTransactionId:self.tcapRemoteTransactionId
                            options:xoptions];
     */
    [self touch];
    self.dialogIsClosed = YES;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
}


- (void)tcapUAbortIndication:(NSString *)userDialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayer *)tcapLayer
                        asn1:(UMASN1Object *)asn1
                     options:(NSDictionary *)options
{
    /*
    [mapUser executeMAP_U_Abort_Ind:self.userIdentifier
                     callingAddress:src
                      calledAddress:dst
                    dialoguePortion:xdialoguePortion
                      transactionId:_tcapLocalTransactionId
                remoteTransactionId:_tcapRemoteTransactionId
                            options:options];
    */
    
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"GSMMAP-Dialog: tcapUAbortIndicationdialogPortion: %@ (%@)",xdialoguePortion,[xdialoguePortion className]];
        [self.logFeed debugText:s];
    }
    [self touch];
    self.dialogIsClosed = YES;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
}

- (void)tcBeginIndication
{
    /* <#code#> */
}


- (void)tcCancelIndication
{
    /* <#code#> */
}

- (void)tcContinueIndication
{
    /* <#code#> */
}


- (void)tcEndIndication
{
    /* <#code#> */
}


- (void)tcInvokeIndication
{
    /* <#code#> */
}


- (void)tcNoticeIndication
{
    /* <#code#> */
}


- (void)tcPAbortIndication
{
    /* <#code#> */
}


- (void)tcRRejectIndication
{
    /* <#code#> */
}



- (void)tcResultLastIndication
{
    /* <#code#> */
}



- (void)tcResultNotLastIndication
{
    /* <#code#> */
}


- (void)tcUAbortIndication
{
    /* <#code#> */
}



- (void)tcUErrorIndication
{
    /* <#code#> */
}



- (void)tcURejectIndication
{
    /* <#code#> */
}



- (void)tcUniIndication
{
/* FIXME */
    
}



- (void)timeOut
{
    @try
    {
        NSLog(@"gsmmap-timeout:%@ (last activity=%@, timeoutInSeconds: %8.2lfs)\n",self.userIdentifier,_lastActivity.description,_timeoutInSeconds);
        /*
        [mapUser executeMAP_P_Abort_Ind:self.userIdentifier
                         callingAddress:remoteAddress
                          calledAddress:localAddress
                        dialoguePortion:NULL
                          transactionId:self.tcapTransactionId
                    remoteTransactionId:self.tcapRemoteTransactionId
                                options:@{}];
         */
        self.dialogIsClosed = YES;
        self.dialogResponseRequired = NO;
        self.openEstablished = NO;
    }
    @catch(NSException *e)
    {
        [_camelLayer.logFeed majorErrorText:[NSString stringWithFormat:@"Exception %@",e]];
    }
}

- (void)dump:(NSFileHandle *)filehandler
{
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendFormat:@"    localTransactionId: %@\n",_tcapLocalTransactionId];
    [s appendFormat:@"    remoteTransactionId: %@\n",_tcapRemoteTransactionId];
    [s appendFormat:@"    userDialogId: %@\n",_userDialogId];
    [s appendFormat:@"    userIdentifier: %@\n",_userIdentifier];
    NSDictionary *d = [_applicationContext objectValue];
    [s appendFormat:@"    applicationContext: %@\n",d[@"objectIdentifier"]];
    d = [_applicationContext2 objectValue];
    [s appendFormat:@"    applicationContext2: %@\n",d[@"objectIdentifier"]];
    [s appendFormat:@"    localAddress: %@\n",[_localAddress description]];
    [s appendFormat:@"    remoteAddress: %@\n",[_remoteAddress description]];
    [s appendFormat:@"    timeoutInSeconds: %8.2lfs\n",self.timeoutInSeconds];
    [s appendFormat:@"    startDate: %@\n",[_startDate description]];
    [s appendFormat:@"    lastActivity: %@\n",[_lastActivity description]];
    [s appendFormat:@"    tcapContinueSeen: %@\n",@(_tcapContinueSeen)];
    [filehandler writeData: [s dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
