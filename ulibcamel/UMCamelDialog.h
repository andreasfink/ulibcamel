//
//  UMCamelDialog.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

#import "UMCamelUserIdentifier.h"
#import "UMLayerCamel.h"
#import "UMCamelOperationCode.h"
#import "UMCamelOperation.h"

@class UMLayerCamel;

@interface UMCamelDialog : UMObject<UMTCAP_UserProtocol>
{
    UMCamelDialogIdentifier         *_userDialogId;
    NSString                        *_tcapLocalTransactionId;
    NSString                        *_tcapRemoteTransactionId;
    UMCamelUserIdentifier           *_camelUserIdentifier;
    id<UMCamelUserProtocol>         _camelUser;
    UMLayerTCAP                     *_tcapLayer;
    UMLayerCamel                    *_camelLayer;
    UMTCAP_asn1_objectIdentifier    *_applicationContext;
    UMTCAP_asn1_objectIdentifier    *_applicationContext2;
    UMTCAP_asn1_userInformation     *_requestUserInfo;
    UMTCAP_asn1_userInformation     *_responseUserInfo;
    UMTCAP_asn1_objectIdentifier    *_responseApplicationContext;
    UMASN1BitString                 *_dialogProtocolVersion;
    SccpAddress                     *_localAddress;
    SccpAddress                     *_remoteAddress;
    UMTCAP_Variant                  _tcapVariant;
    BOOL                            _initiatedOutgoing;
    BOOL                            _openEstablished;
    BOOL                            _returnResultLastSent;
    BOOL                            _dialogRequestRequired;
    BOOL                            _dialogResponseRequired;
    BOOL                            _dialogIsClosed;
    BOOL                            _dialogShallClose;
    BOOL                            _tcapContinueSeen;

    UMLogLevel                      _logLevel;

    NSDate                          *_startDate;
    UMAtomicDate                    *_lastActivity;
    NSDictionary                    *_outboundOptions;
    UMSynchronizedArray             *_pendingOutgoingComponents;
    UMSynchronizedArray             *_pendingIncomingComponents;
    
    NSTimeInterval                  _timeoutInSeconds;
    int64_t                         _nextInvokeId;
    BOOL                        _keepOriginalSccpAddressForTcapContinue;

}


#pragma mark -
#pragma mark Properties

@property(readwrite,strong) UMCamelDialogIdentifier         *userDialogId;
@property(readwrite,strong) NSString                        *tcapLocalTransactionId;
@property(readwrite,strong) NSString                        *tcapRemoteTransactionId;
@property(readwrite,strong) UMCamelUserIdentifier           *userIdentifier;
@property(readwrite,strong) id<UMCamelUserProtocol>         camelUser;
@property(readwrite,strong) UMLayerTCAP                     *tcapLayer;
@property(readwrite,strong) UMLayerCamel                    *camelLayer;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier    *applicationContext;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier    *applicationContext2;
@property(readwrite,strong) UMTCAP_asn1_userInformation     *requestUserInfo;
@property(readwrite,strong) UMTCAP_asn1_userInformation     *responseUserInfo;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier    *responseApplicationContext;
@property(readwrite,strong) UMASN1BitString                 *dialogProtocolVersion;
@property(readwrite,strong,atomic) SccpAddress              *localAddress;
@property(readwrite,strong,atomic) SccpAddress              *remoteAddress;
@property(readwrite,assign) UMTCAP_Variant                  tcapVariant;
@property(readwrite,assign,atomic) BOOL                     initiatedOutgoing;
@property(readwrite,assign,atomic) BOOL                     openEstablished;
@property(readwrite,assign,atomic) BOOL                     returnResultLastSent;
@property(readwrite,assign,atomic) BOOL                     dialogRequestRequired;
@property(readwrite,assign,atomic) BOOL                     dialogResponseRequired;
@property(readwrite,assign,atomic) BOOL                     dialogIsClosed;
@property(readwrite,assign,atomic) BOOL                     dialogShallClose;
@property(readwrite,assign,atomic) BOOL                     tcapContinueSeen;
@property(readwrite,assign,atomic) BOOL                     keepOriginalSccpAddressForTcapContinue;

@property(readwrite,strong,atomic)  NSDictionary            *outboundOptions;

@property(readwrite,assign,atomic) UMLogLevel               logLevel;

- (NSTimeInterval)timeoutInSeconds;
- (void)setTimeoutInSeconds:(NSTimeInterval)to;

#pragma mark -
#pragma mark Dialog Handling

-(void) CAMEL_Open_Req_forUser:(id<UMCamelUserProtocol>)user
                        tcap:(UMLayerTCAP *)xtcap
                         map:(UMLayerCamel *)xcamel
                     variant:(UMTCAP_Variant)xvariant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
          applicationContext:(UMTCAP_asn1_objectIdentifier *)appContext
                    userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
              userIdentifier:(UMCamelUserIdentifier *)userIdentifier
                     options:(NSDictionary *)xoptions;

- (void) CAMEL_Open_Ind_forUser:(id<UMCamelUserProtocol>)user
                         tcap:(UMLayerTCAP *)xtcap
                          map:(UMLayerCamel *)xcamel
                      variant:(UMTCAP_Variant)xvariant
               callingAddress:(SccpAddress *)src
                calledAddress:(SccpAddress *)dst
              dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                transactionId:(NSString *)localTransactionId
          remoteTransactionId:(NSString *)remotelTransactionId
                      options:(NSDictionary *)xoptions;

- (void)CAMEL_Delimiter_Req:(NSDictionary *)xoptions
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                 userInfo:(UMTCAP_asn1_userInformation *)xuserInfo;

-(void)CAMEL_Close_Req:(NSDictionary *)xoptions
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
             userInfo:(UMTCAP_asn1_userInformation *)userInfo;


- (void)CAMEL_Error_Req:(UMASN1Object *)param
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
      dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            operation:(int64_t)operation
              options:(NSDictionary *)options;

- (void)CAMEL_Reject_Req:(UMASN1Object *)param
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              invokeId:(int64_t)invokeId
               problem:(UMASN1Object *)problem
               options:(NSDictionary *)options;

-(void) CAMEL_U_Abort_Ind:(NSDictionary *)options
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId;

-(void) CAMEL_P_Abort_Ind:(NSDictionary *)options
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
          dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            transactionId:(NSString *)localTransactionId
      remoteTransactionId:(NSString *)remoteTransactionId;


-(void) CAMEL_U_Abort_Req:(NSDictionary *)xoptions
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
                    cause:(int64_t)cause
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                 userInfo:(UMTCAP_asn1_userInformation *)userInfo;
#pragma mark -
#pragma mark Component Handling

- (void) CAMEL_Invoke_Req:(UMASN1Object *)param
                 invokeId:(int64_t)invokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                 linkedId:(int64_t)linkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                   opCode:(UMCamelOperation *)opcode
                     last:(BOOL)last
                  options:(NSDictionary *)options;




- (void)CAMEL_Invoke_Ind:(UMASN1Object *)params
                  opCode:(UMCamelOperation *)opcode
                invokeId:(int64_t)invokeId
                linkedId:(int64_t)linkedId
                    last:(BOOL)last
                 options:(NSDictionary *)options;

-(void) CAMEL_Delimiter_Ind:(NSDictionary *)options
                     dialog:(UMCamelDialogIdentifier *)dialogId
             callingAddress:(SccpAddress *)src
              calledAddress:(SccpAddress *)dst
            dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              transactionId:(NSString *)localTransactionId
        remoteTransactionId:(NSString *)remoteTransactionId;

-(void) CAMEL_Continue_Ind:(NSDictionary *)options
            callingAddress:(SccpAddress *)src
             calledAddress:(SccpAddress *)dst
           dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
             transactionId:(NSString *)localTransactionId
       remoteTransactionId:(NSString *)remoteTransactionId;

-(void) CAMEL_Close_Ind:(NSDictionary *)options;

-(void) CAMEL_Notice_Ind:(NSDictionary *)options
       tcapTransactionId:(NSString *)localTransactionId
                  reason:(SCCP_ReturnCause)returnCause;

#pragma mark -
#pragma mark Helper Methods
- (void)CAMEL_ProcessComponents:(NSArray *)components
                        options:(NSDictionary *)xoptions
                        willEnd:(BOOL)willEnd;

#pragma mark -
#pragma mark Various Background Tasks

- (void)touch;
- (BOOL)isTimedOut;
- (void)timeOut;
- (void)dump:(NSFileHandle *)filehandler;
- (void)setOptions:(NSDictionary *)dict;

@end

