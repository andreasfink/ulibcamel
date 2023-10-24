//
//  UMCamel_CallGapArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 22.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_CallGapArg.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_CallGapArg

- (void) processBeforeEncode
{
 [super processBeforeEncode];
 [_asn1_tag setTagIsConstructed];
 _asn1_list = [[NSMutableArray alloc]init];
 CONTEXT_SPECIFIC_ADD(0,_gapCriteria);
 CONTEXT_SPECIFIC_ADD(1,_gapIndicators);
 CONTEXT_SPECIFIC_ADD(2,_controlType);
 CONTEXT_SPECIFIC_ADD(3,_gapTreatment);
 CONTEXT_SPECIFIC_ADD(4,_extensions);
}


- (UMCamel_CallGapArg *) processAfterDecodeWithContext:(id)context
{
 int p=0;
 UMASN1Object *o = [self getObjectAtPosition:p++];

 GET_CONTEXT_SPECIFIC(0,_gapCriteria,UMCamel_GapCriteria,o,p);
 GET_CONTEXT_SPECIFIC(1,_gapIndicators,UMCamel_GapIndicators,o,p);
 GET_CONTEXT_SPECIFIC(2,_controlType,UMCamel_ControlType,o,p);
 GET_CONTEXT_SPECIFIC(3,_gapTreatment,UMCamel_GapTreatment,o,p);
 GET_CONTEXT_SPECIFIC(4,_extensions,UMCamel_ExtensionsArray,o,p);
 return self;
}


- (NSString *) objectName
{
    return @"CallGapArg";
}

- (id) objectValue
{
 UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
 DICT_ADD(dict,_gapCriteria,@"gapCriteria");
 DICT_ADD(dict,_gapIndicators,@"gapIndicators");
 DICT_ADD(dict,_controlType,@"controlType");
 DICT_ADD(dict,_gapTreatment,@"gapTreatment");
 DICT_ADD(dict,_extensions,@"extensions");

 return dict;
}

@end
