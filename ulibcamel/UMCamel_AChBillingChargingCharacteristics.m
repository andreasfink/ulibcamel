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

/*
actimeDurationCharging [0]   SEQUENCE
{
    maxCallPeriodDuration     [0] INTEGER (1..864000),
    releaseIfdurationExceeded [1] BOOLEAN               DEFAULT FALSE,
    tariffSwitchInterval      [2] INTEGER (1..86400)    OPTIONAL,
    actone                      [3] BOOLEAN               DEFAULT FALSE,
    extensions                [4] ExtensionsArray       OPTIONAL
}
*/
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


