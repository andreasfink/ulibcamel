//
//  UMCamel_CAMEL_FCIBillingChargingCharacteristics.m
//  ulibcamel
//
//  Created by Andreas Fink on 02.09.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_CAMEL_FCIBillingChargingCharacteristics.h"
#import "UMCamel_ASN1_macros.h"


@implementation  UMCamel_CAMEL_FCIBillingChargingCharacteristics

- (NSString *) objectName
{
    return @"CAMEL-FCIBillingChargingCharacteristics";
}


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    CONTEXT_SPECIFIC_ADD(0,_freeFormatData);
    CONTEXT_SPECIFIC_ADD(1,_partyToCharge4);
    CONTEXT_SPECIFIC_ADD(2,_appendFreeFormatData);
}


- (UMCamel_CAMEL_FCIBillingChargingCharacteristics *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    GET_CONTEXT_SPECIFIC(0,_freeFormatData,UMCamel_FreeFormatData,o,p);
    GET_CONTEXT_SPECIFIC(1,_partyToCharge4,UMCamel_SendingSideID,o,p);
    GET_CONTEXT_SPECIFIC(2,_appendFreeFormatData,UMCamel_AppendFreeFormatData,o,p);
    return self;
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_freeFormatData,@"freeFormatData");
    DICT_ADD(dict,_partyToCharge4,@"partyToCharge4");
    DICT_ADD(dict,_appendFreeFormatData,@"appendFreeFormatData");
    return dict;
}

@end

@end
