//
//  UMCamel_CallInformationRequestArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_CallInformationRequestArg.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_CallInformationRequestArg


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    CONTEXT_SPECIFIC_ADD(0,_requestedInformationTypeList);
    CONTEXT_SPECIFIC_ADD(2,_extensions);
    CONTEXT_SPECIFIC_ADD(3,_legID3);
}

- (UMCamel_CallInformationRequestArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    GET_CONTEXT_SPECIFIC(0,_requestedInformationTypeList,UMCamel_RequestedInformationTypeList,o,p);
    GET_CONTEXT_SPECIFIC(2,_extensions,UMCamel_ExtensionsArray,o,p);
    GET_CONTEXT_SPECIFIC(3,_legID3,UMCamel_SendingSideID,o,p);
    return self;
}

- (NSString *) objectName
{
    return @"CallInformationRequestArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_requestedInformationTypeList,@"requestedInformationTypeList");
    DICT_ADD(dict,_extensions,@"extensions");
    DICT_ADD(dict,_legID3,@"legID3");
    return dict;
}

@end
