//
//  UMCamel_InitialDPArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_InitialDPArg.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_InitialDPArg

/*
*/
- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];

    CONTEXT_SPECIFIC_ADD(0,_serviceKey)
    CONTEXT_SPECIFIC_ADD(2,_calledPartyNumber)
    CONTEXT_SPECIFIC_ADD(3,_callingPartyNumber)
    CONTEXT_SPECIFIC_ADD(4,_callingPartysCategory)
    CONTEXT_SPECIFIC_ADD(7,_cGEncountered)
    CONTEXT_SPECIFIC_ADD(8,_iPSSPCapabilities)
    CONTEXT_SPECIFIC_ADD(10,_locationNumber)
    CONTEXT_SPECIFIC_ADD(12,_originalCalledPartyID)
    CONTEXT_SPECIFIC_ADD(15,_extensions)
    CONTEXT_SPECIFIC_ADD(23,_highLayerCompatibility)
    CONTEXT_SPECIFIC_ADD(25,_additionalCallingPartyNumber)
    CONTEXT_SPECIFIC_ADD(27,_bearerCapability)
    CONTEXT_SPECIFIC_ADD(28,_eventTypeBCSM)
    CONTEXT_SPECIFIC_ADD(29,_redirectingPartyID)
    CONTEXT_SPECIFIC_ADD(30,_redirectionInformation)
    CONTEXT_SPECIFIC_ADD(17,_cause)
    CONTEXT_SPECIFIC_ADD(32,_serviceInteractionIndicatorsTwo)
    CONTEXT_SPECIFIC_ADD(37,_carrier)
    CONTEXT_SPECIFIC_ADD(45,_cug_Index)
    CONTEXT_SPECIFIC_ADD(46,_cug_Interlock)
    CONTEXT_SPECIFIC_ADD_NULL(47,_cug_OutgoingAccess)
    CONTEXT_SPECIFIC_ADD(50,_iMSI)
    CONTEXT_SPECIFIC_ADD(51,_subscriberState)
    CONTEXT_SPECIFIC_ADD(52,_locationInformation)
    CONTEXT_SPECIFIC_ADD(53,_ext_basicServiceCode)
    CONTEXT_SPECIFIC_ADD(54,_callReferenceNumber)
    CONTEXT_SPECIFIC_ADD(55,_mscAddress)
    CONTEXT_SPECIFIC_ADD(56,_calledPartyBCDNumber)
    CONTEXT_SPECIFIC_ADD(57,_timeAndTimezone)
    CONTEXT_SPECIFIC_ADD_NULL(58,_gsm_ForwardingPending)
    CONTEXT_SPECIFIC_ADD(59,_initialDPArgExtension)
}


- (UMCamel_InitialDPArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];

    GET_CONTEXT_SPECIFIC(0,_serviceKey,UMCamel_ServiceKey,o,p)
    GET_CONTEXT_SPECIFIC(2,_calledPartyNumber,UMCamel_CalledPartyNumber,o,p)
    GET_CONTEXT_SPECIFIC(3,_callingPartyNumber,UMCamel_CallingPartyNumber,o,p)
    GET_CONTEXT_SPECIFIC(4,_callingPartysCategory,UMCamel_CallingPartysCategory,o,p)
    GET_CONTEXT_SPECIFIC(7,_cGEncountered,UMCamel_CGEncountered,o,p)
    GET_CONTEXT_SPECIFIC(8,_iPSSPCapabilities,UMCamel_IPSSPCapabilities,o,p)
    GET_CONTEXT_SPECIFIC(10,_locationNumber,UMCamel_LocationNumber,o,p)
    GET_CONTEXT_SPECIFIC(12,_originalCalledPartyID,UMCamel_OriginalCalledPartyID,o,p)
    GET_CONTEXT_SPECIFIC(15,_extensions,UMCamel_ExtensionsArray,o,p)
    GET_CONTEXT_SPECIFIC(23,_highLayerCompatibility,UMCamel_HighLayerCompatibility,o,p)
    GET_CONTEXT_SPECIFIC(25,_additionalCallingPartyNumber,UMCamel_AdditionalCallingPartyNumber,o,p)
    GET_CONTEXT_SPECIFIC(27,_bearerCapability,UMCamel_BearerCapability,o,p)
    GET_CONTEXT_SPECIFIC(28,_eventTypeBCSM,UMCamel_EventTypeBCSM,o,p)
    GET_CONTEXT_SPECIFIC(29,_redirectingPartyID,UMCamel_RedirectingPartyID,o,p)
    GET_CONTEXT_SPECIFIC(30,_redirectionInformation,UMCamel_RedirectionInformation,o,p)
    GET_CONTEXT_SPECIFIC(17,_cause,UMCamel_Cause,o,p)
    GET_CONTEXT_SPECIFIC(32,_serviceInteractionIndicatorsTwo,UMCamel_ServiceInteractionIndicatorsTwo,o,p)
    GET_CONTEXT_SPECIFIC(37,_carrier,UMCamel_Carrier,o,p)
    GET_CONTEXT_SPECIFIC(45,_cug_Index,UMCamel_CUG_Index,o,p)
    GET_CONTEXT_SPECIFIC(46,_cug_Interlock,UMCamel_CUG_Interlock,o,p)
    GET_CONTEXT_SPECIFIC_NULL(47,_cug_OutgoingAccess,o,p)
    GET_CONTEXT_SPECIFIC(50,_iMSI,UMCamel_IMSI,o,p)
    GET_CONTEXT_SPECIFIC(51,_subscriberState,UMCamel_SubscriberState,o,p)
    GET_CONTEXT_SPECIFIC(52,_locationInformation,UMCamel_LocationInformation,o,p)
    GET_CONTEXT_SPECIFIC(53,_ext_basicServiceCode,UMCamel_Ext_BasicServiceCode,o,p)
    GET_CONTEXT_SPECIFIC(54,_callReferenceNumber,UMCamel_CallReferenceNumber,o,p)
    GET_CONTEXT_SPECIFIC(55,_mscAddress,UMCamel_ISDN_AddressString,o,p)
    GET_CONTEXT_SPECIFIC(56,_calledPartyBCDNumber,UMCamel_CalledPartyBCDNumber,o,p)
    GET_CONTEXT_SPECIFIC(57,_timeAndTimezone,UMCamel_TimeAndTimezone,o,p)
    GET_CONTEXT_SPECIFIC_NULL(58,_gsm_ForwardingPending,o,p)
    GET_CONTEXT_SPECIFIC(59,_initialDPArgExtension,UMCamel_InitialDPArgExtension,o,p)

    return self;
}

- (NSString *) objectName
{
    return @"InitialDPArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    
    DICT_ADD(dict,_serviceKey,@"serviceKey");
    DICT_ADD(dict,_calledPartyNumber,@"calledPartyNumber");
    DICT_ADD(dict,_callingPartyNumber,@"callingPartyNumber");
    DICT_ADD(dict,_callingPartysCategory,@"callingPartysCategory");
    DICT_ADD(dict,_cGEncountered,@"cGEncountered");
    DICT_ADD(dict,_iPSSPCapabilities,@"iPSSPCapabilities");
    DICT_ADD(dict,_locationNumber,@"locationNumber");
    DICT_ADD(dict,_originalCalledPartyID,@"originalCalledPartyID");
    DICT_ADD(dict,_extensions,@"extensions");
    DICT_ADD(dict,_highLayerCompatibility,@"highLayerCompatibility");
    DICT_ADD(dict,_additionalCallingPartyNumber,@"additionalCallingPartyNumber");
    DICT_ADD(dict,_bearerCapability,@"bearerCapability");
    DICT_ADD(dict,_eventTypeBCSM,@"eventTypeBCSM");
    DICT_ADD(dict,_redirectingPartyID,@"redirectingPartyID");
    DICT_ADD(dict,_redirectionInformation,@"redirectionInformation");
    DICT_ADD(dict,_cause,@"cause");
    DICT_ADD(dict,_serviceInteractionIndicatorsTwo,@"serviceInteractionIndicatorsTwo");
    DICT_ADD(dict,_carrier,@"carrier");
    DICT_ADD(dict,_cug_Index,@"cug-Index");
    DICT_ADD(dict,_cug_Interlock,@"cug-Interlock");
    DICT_ADD_NULL(dict,_cug_OutgoingAccess,@"cug-OutgoingAccess");
    DICT_ADD(dict,_iMSI,@"iMSI");
    DICT_ADD(dict,_subscriberState,@"subscriberState");
    DICT_ADD(dict,_locationInformation,@"locationInformation");
    DICT_ADD(dict,_ext_basicServiceCode,@"ext_basicServiceCode");
    DICT_ADD(dict,_callReferenceNumber,@"callReferenceNumber");
    DICT_ADD(dict,_mscAddress,@"mscAddress");
    DICT_ADD(dict,_calledPartyBCDNumber,@"calledPartyBCDNumber");
    DICT_ADD(dict,_timeAndTimezone,@"timeAndTimezone");
    DICT_ADD_NULL(dict,_gsm_ForwardingPending,@"gsm-ForwardingPending");
    DICT_ADD(dict,_initialDPArgExtension,@"initialDPArgExtension");
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

