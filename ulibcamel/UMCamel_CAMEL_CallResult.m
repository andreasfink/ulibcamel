//
//  UMCamel_CAMEL_CallResult.m
//  ulibcamel
//
//  Created by Andreas Fink on 30.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_CAMEL_CallResult.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_CAMEL_CallResult

- (NSString *) objectName
{
    return @"CAMEL-CallResult";
}


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    CONTEXT_SPECIFIC_ADD(0,_timeDurationChargingResult);
    CONTEXT_SPECIFIC_ADD_NULL(99,_void99);
}


- (UMCamel_CAMEL_CallResult *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    GET_CONTEXT_SPECIFIC(0,_timeDurationChargingResult,UMCamel_TimeDurationChargingResult,o,p);
    GET_CONTEXT_SPECIFIC_NULL(99,_void99,o,p);
    return self;
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_timeDurationChargingResult,@"_timeDurationChargingResult");
    DICT_ADD_NULL(dict,_void99,@"void");
    return dict;
}

@end
