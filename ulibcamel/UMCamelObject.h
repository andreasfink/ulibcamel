//
//  UMCamelObject.h
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

@class UMCamelInvoke;

@interface UMCamelObject : UMASN1Choice
{
    UMCamelInvoke *_invoke;
}

- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_InternalOperation)operation
               operationName:(NSString *__autoreleasing *)xoperationName
                     context:(id)context;

@end

