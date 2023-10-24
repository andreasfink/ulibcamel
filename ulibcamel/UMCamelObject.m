//
//  UMCamelObject.m
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamelObject.h>
#import <ulibcamel/UMCamelInvoke.h>

@implementation UMCamelObject


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    if(_invoke)
    {
        [self cloneFrom:_invoke];
    }
}

- (UMASN1Object *) processAfterDecodeWithContext:(id)context
{
    if((_asn1_tag.tagNumber == 1) && (_asn1_tag.tagClass = UMASN1Class_ContextSpecific))
    {
        return [[UMCamelInvoke alloc]initWithASN1Object:self context:context];
    }
    return self;
}

- (NSString *) objectName
{
    return @"UMCamelObject";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_invoke)
    {
        return _invoke.objectValue;
    }
    return dict;
}


- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_InternalOperation)operation
               operationName:(NSString *__autoreleasing *)xoperationName
                     context:(id)context
{
    return params;
}

@end

