//
//  UMCamel_AssistRequestInstructionsArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 03.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//


#import <ulibcamel/UMCamel_AssistRequestInstructionsArg.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_AssistRequestInstructionsArg

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];

    CONTEXT_SPECIFIC_ADD(0,_correlationID);
    CONTEXT_SPECIFIC_ADD(2,_iPSSPCapabilities);
    CONTEXT_SPECIFIC_ADD(3,_extensions);
}

- (UMCamel_AssistRequestInstructionsArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];

    GET_CONTEXT_SPECIFIC(0,_correlationID,UMCamel_CorrelationID,o,p);
    GET_CONTEXT_SPECIFIC(2,_iPSSPCapabilities,UMCamel_IPSSPCapabilities,o,p);
    GET_CONTEXT_SPECIFIC(3,_extensions,UMCamel_ExtensionsArray,o,p);
    return self;
}

- (NSString *) objectName
{
    return @"AssistRequestInstructionsArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];

    DICT_ADD(dict,_correlationID,@"correlationID");
    DICT_ADD(dict,_iPSSPCapabilities,@"iPSSPCapabilities");
    DICT_ADD(dict,_extensions,@"extensions");
    return dict;
}

- (UMASN1Object *)decodeASN1opcode:(int64_t)opcode
                     operationType:(UMTCAP_InternalOperation)operation
                     operationName:(NSString **)xop
                       withContext:(id)context
{
    return self;
}

@end
