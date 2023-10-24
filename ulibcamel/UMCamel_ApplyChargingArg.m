//
//  UMCamel_ApplyChargingArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 22.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_ApplyChargingArg.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_ApplyChargingArg


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    CONTEXT_SPECIFIC_ADD(0,_aChBillingChargingCharacteristics);
    CONTEXT_SPECIFIC_ADD(2,_partyToCharge1);
    CONTEXT_SPECIFIC_ADD(3,_extensions);
    CONTEXT_SPECIFIC_ADD(50,_aChChargingAddress);
}

- (UMCamel_ApplyChargingArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    GET_CONTEXT_SPECIFIC(0,_aChBillingChargingCharacteristics,UMCamel_AChBillingChargingCharacteristics,o,p);
    GET_CONTEXT_SPECIFIC(2,_partyToCharge1,UMCamel_SendingSideID,o,p);
    GET_CONTEXT_SPECIFIC(3,_extensions,UMCamel_ExtensionsArray,o,p);
    GET_CONTEXT_SPECIFIC(50,_aChChargingAddress,UMCamel_AChChargingAddress,o,p);
    return self;
}

- (NSString *) objectName
{
    return @"ApplyChargingArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_aChBillingChargingCharacteristics,@"aChBillingChargingCharacteristics");
    DICT_ADD(dict,_partyToCharge1,@"partyToCharge1");
    DICT_ADD(dict,_extensions,@"extensions");
    DICT_ADD(dict,_aChChargingAddress,@"aChChargingAddress");
    return dict;
}

@end
