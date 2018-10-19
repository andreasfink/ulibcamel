//
//  UMCamel_AChBillingChargingCharacteristics.m
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_AChBillingChargingCharacteristics.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_AChBillingChargingCharacteristics


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    CONTEXT_SPECIFIC_ADD(0,_actimeDurationCharging);
}


- (UMCamel_AChBillingChargingCharacteristics *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];

    GET_CONTEXT_SPECIFIC(0,_actimeDurationCharging,UMCamel_ACTimeDurationCharging,o,p);
    return self;
}

- (NSString *) objectName
{
    return @"AChBillingChargingCharacteristics";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_actimeDurationCharging,@"actimeDurationCharging");
    return dict;
}

@end


