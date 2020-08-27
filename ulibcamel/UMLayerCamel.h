//
//  UMLayerCamel.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>
#import "UMCamelProviderProtocol.h"
#import "UMCamelUserProtocol.h"
#import "UMCamelDialogIdentifier.h"
#import "UMCamelOperationCode.h"


@protocol UMLayerCamelApplicationContextProtocol<NSObject>
- (UMLayerTCAP *)getTCAP:(NSString *)name;
@end

@class UMCamelDialog;

@interface UMLayerCamel : UMLayer<UMTCAP_UserProtocol,UMCamelProviderProtocol>
{
    UMMutex                     *_dialogIdLock;
    UMSynchronizedDictionary    *_dialogs;
    id<UMCamelUserProtocol>     _user;
    UMLayerTCAP                 *_tcap;
    NSString                    *_address;
    NSTimeInterval              _timeout;
}

@property(readwrite,strong,atomic)  UMLayerTCAP *tcap;
@property(readwrite,strong,atomic)  NSString *address;
@property(readwrite,assign,atomic)  NSTimeInterval dialogTimeout;

+ (NSString *)decodeError:(int)err;
- (UMCamelDialog *)getNewDialogForUser:(id<UMCamelUserProtocol>)user
                                withId:(UMCamelDialogIdentifier *)dialogId;
- (UMCamelDialog *)getNewDialogForUser:(id<UMCamelUserProtocol>)user;
- (UMCamelDialogIdentifier *)getNewUserDialogId;
- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMLayerCamelApplicationContextProtocol>)appContext;
+ (UMASN1Object *)decodeAsn1:(UMASN1Object *)input;
- (NSString *)status;
- (void)startUp;
@end
