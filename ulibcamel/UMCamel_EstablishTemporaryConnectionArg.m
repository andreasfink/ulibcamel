//
//  UMCamel_EstablishTemporaryConnectionArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 03.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_EstablishTemporaryConnectionArg.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_EstablishTemporaryConnectionArg

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];

    CONTEXT_SPECIFIC_ADD(0,_assistingSSPIPRoutingAddress);
    CONTEXT_SPECIFIC_ADD(1,_correlationID);
    CONTEXT_SPECIFIC_ADD(3,_scfID);
    CONTEXT_SPECIFIC_ADD(4,_extensions);
    CONTEXT_SPECIFIC_ADD(5,_carrier);
    CONTEXT_SPECIFIC_ADD(6,_serviceInteractionIndicatorsTwo);
    CONTEXT_SPECIFIC_ADD(7,_callSegmentID);
    CONTEXT_SPECIFIC_ADD(50,_naOliInfo);
    CONTEXT_SPECIFIC_ADD(51,_chargeNumber);
    CONTEXT_SPECIFIC_ADD(52,_originalCalledPartyID);
    CONTEXT_SPECIFIC_ADD(53,_callingPartyNumber);
}

- (UMCamel_EstablishTemporaryConnectionArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];

    GET_CONTEXT_SPECIFIC(0,_assistingSSPIPRoutingAddress,UMCamel_AssistingSSPIPRoutingAddress,o,p);
    GET_CONTEXT_SPECIFIC(1,_correlationID,UMCamel_CorrelationID,o,p);
    GET_CONTEXT_SPECIFIC(3,_scfID,UMCamel_ScfID,o,p);
    GET_CONTEXT_SPECIFIC(4,_extensions,UMCamel_ExtensionsArray,o,p);
    GET_CONTEXT_SPECIFIC(5,_carrier,UMCamel_Carrier,o,p);
    GET_CONTEXT_SPECIFIC(6,_serviceInteractionIndicatorsTwo,UMCamel_ServiceInteractionIndicatorsTwo,o,p);
    GET_CONTEXT_SPECIFIC(7,_callSegmentID,UMCamel_CallSegmentID,o,p);
    GET_CONTEXT_SPECIFIC(50,_naOliInfo,UMCamel_NAOliInfo,o,p);
    GET_CONTEXT_SPECIFIC(51,_chargeNumber,UMCamel_ChargeNumber,o,p);
    GET_CONTEXT_SPECIFIC(52,_originalCalledPartyID,UMCamel_OriginalCalledPartyID,o,p);
    GET_CONTEXT_SPECIFIC(53,_callingPartyNumber,UMCamel_CallingPartyNumber,o,p);
    return self;
}

- (NSString *) objectName
{
    return @"AssistRequestInstructionsArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];

    DICT_ADD(dict,_assistingSSPIPRoutingAddress,@"assistingSSPIPRoutingAddress");
    DICT_ADD(dict,_correlationID,@"correlationID");
    DICT_ADD(dict,_scfID,@"scfID");
    DICT_ADD(dict,_extensions,@"extensions");
    DICT_ADD(dict,_carrier,@"carrier");
    DICT_ADD(dict,_serviceInteractionIndicatorsTwo,@"serviceInteractionIndicatorsTwo");
    DICT_ADD(dict,_callSegmentID,@"callSegmentID");
    DICT_ADD(dict,_naOliInfo,@"naOliInfo");
    DICT_ADD(dict,_chargeNumber,@"chargeNumber");
    DICT_ADD(dict,_originalCalledPartyID,@"originalCalledPartyID");
    DICT_ADD(dict,_callingPartyNumber,@"callingPartyNumber");
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
