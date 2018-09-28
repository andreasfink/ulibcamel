//
//  UMCamelObject.m
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamelObject.h"
#import "UMCamelInvoke.h"

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

@end

