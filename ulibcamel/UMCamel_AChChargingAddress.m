//
//  UMCamel_AChChargingAddress.m
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_AChChargingAddress.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_AChChargingAddress


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    CONTEXT_SPECIFIC_ADD(2,_legID);
    CONTEXT_SPECIFIC_ADD(50,_srfConnection);
}


- (UMCamel_AChChargingAddress *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];

    GET_CONTEXT_SPECIFIC(2,_legID,UMCamel_LegID,o,p);
    GET_CONTEXT_SPECIFIC(50,_srfConnection,UMCamel_CallSegmentID,o,p);
    return self;
}

- (NSString *) objectName
{
    return @"AChChargingAddress";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];


    DICT_ADD(dict,_legID,@"legID");
    DICT_ADD(dict,_srfConnection,@"srfConnection");
    return dict;
}

@end


