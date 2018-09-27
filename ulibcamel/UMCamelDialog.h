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
    UMCamelUserIdentifier           *_userIdentifier;
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
@property(readwrite,strong,atomic)  NSDictionary            *outboundOptions;

@property(readwrite,assign,atomic) UMLogLevel               logLevel;

- (NSTimeInterval)timeoutInSeconds;
- (void)setTimeoutInSeconds:(NSTimeInterval)to;


#pragma mark -
#pragma mark Various Background Tasks

- (void)touch;
- (BOOL)isTimedOut;
- (void)timeOut;

- (void)dump:(NSFileHandle *)filehandler;

@end

