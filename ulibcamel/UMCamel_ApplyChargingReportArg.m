//
//  UMCamel_ApplyChargingReportArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 22.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_ApplyChargingReportArg.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>
#import <ulibcamel/UMCamel_CAMEL_CallResult.h>

@implementation UMCamel_ApplyChargingReportArg

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    ASN_DIRECT_ADD(_callresultOctet);
}

- (UMCamel_ApplyChargingReportArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    GET_ASN_DIRECT(_callresultOctet,UMCamel_CAMEL_CallResult,o,p);
    return self;
}

- (NSString *) objectName
{
    return @"ApplyChargingArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_callresultOctet,@"callresultOctet");
    return dict;
}

@end

