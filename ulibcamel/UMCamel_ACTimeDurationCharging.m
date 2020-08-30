//
//  UMCamel_ACTimeDurationCharging.m
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_ACTimeDurationCharging.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_ACTimeDurationCharging


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
    CONTEXT_SPECIFIC_ADD(0,_maxCallPeriodDuration);
    CONTEXT_SPECIFIC_ADD(1,_releaseIfdurationExceeded);
    CONTEXT_SPECIFIC_ADD(2,_tariffSwitchInterval);
    CONTEXT_SPECIFIC_ADD(3,_actone);
    CONTEXT_SPECIFIC_ADD(4,_extensions);
}


- (UMCamel_ACTimeDurationCharging *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];

    GET_CONTEXT_SPECIFIC(0,_maxCallPeriodDuration,UMASN1Integer,o,p);
    GET_CONTEXT_SPECIFIC(2,_releaseIfdurationExceeded,UMASN1Boolean,o,p);
    GET_CONTEXT_SPECIFIC(3,_tariffSwitchInterval,UMASN1Integer,o,p);
    GET_CONTEXT_SPECIFIC(4,_actone,UMASN1Boolean,o,p);
    GET_CONTEXT_SPECIFIC(5,_extensions,UMCamel_ExtensionsArray,o,p);
    return self;
}

- (NSString *) objectName
{
    return @"ACTimeDurationCharging";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_maxCallPeriodDuration,@"maxCallPeriodDuration");
    DICT_ADD(dict,_releaseIfdurationExceeded,@"releaseIfdurationExceeded");
    DICT_ADD(dict,_tariffSwitchInterval,@"tariffSwitchInterval");
    DICT_ADD(dict,_actone,@"actone");
    DICT_ADD(dict,_extensions,@"extensions");
    return dict;
}

@end


