//
//  UMCamel_InitialDPSMSArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//


#import <ulibcamel/UMCamel_InitialDPSMSArg.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_InitialDPSMSArg

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    
    
    CONTEXT_SPECIFIC_ADD(0,_serviceKey);
    CONTEXT_SPECIFIC_ADD(1,_destinationSubscriberNumber);
    CONTEXT_SPECIFIC_ADD(2,_callingPartyNumberas);
    CONTEXT_SPECIFIC_ADD(3,_eventTypeSMS);
    CONTEXT_SPECIFIC_ADD(4,_iMSI);
    CONTEXT_SPECIFIC_ADD(5,_locationInformationMSC);
    CONTEXT_SPECIFIC_ADD(6,_locationInformationGPRS);
    CONTEXT_SPECIFIC_ADD(7,_sMSCAddress);
    CONTEXT_SPECIFIC_ADD(8,_timeAndTimezone);
    CONTEXT_SPECIFIC_ADD(9,_tPShortMessageSpecificInfo);
    CONTEXT_SPECIFIC_ADD(10,_tPProtocolIdentifier);
    CONTEXT_SPECIFIC_ADD(11,_tPDataCodingScheme);
    CONTEXT_SPECIFIC_ADD(12,_tPValidityPeriod);
    CONTEXT_SPECIFIC_ADD(13,_extensions);
    //...
    CONTEXT_SPECIFIC_ADD(14,_smsReferenceNumber);
    CONTEXT_SPECIFIC_ADD(15,_mscAddress);
    CONTEXT_SPECIFIC_ADD(16,_sgsnNumber);
    CONTEXT_SPECIFIC_ADD(17,_ms_Classmark2);
    CONTEXT_SPECIFIC_ADD(18,_gPRSMSClass);
    CONTEXT_SPECIFIC_ADD(19,_iMEI);
    CONTEXT_SPECIFIC_ADD(20,_calledPartyNumberSMS);
    
}


- (UMCamel_InitialDPSMSArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
 

    GET_CONTEXT_SPECIFIC(0,_serviceKey,UMCamel_ServiceKey,o,p);
    GET_CONTEXT_SPECIFIC(1,_destinationSubscriberNumber,UMCamel_CalledPartyBCDNumber,o,p);
    GET_CONTEXT_SPECIFIC(2,_callingPartyNumberas,UMCamel_SMS_AddressString,o,p);
    GET_CONTEXT_SPECIFIC(3,_eventTypeSMS,UMCamel_EventTypeSMS,o,p);
    GET_CONTEXT_SPECIFIC(4,_iMSI,UMCamel_IMSI,o,p);
    GET_CONTEXT_SPECIFIC(5,_locationInformationMSC,UMCamel_LocationInformation,o,p);
    GET_CONTEXT_SPECIFIC(6,_locationInformationGPRS,UMCamel_LocationInformationGPRS,o,p);
    GET_CONTEXT_SPECIFIC(7,_sMSCAddress,UMCamel_ISDN_AddressString,o,p);
    GET_CONTEXT_SPECIFIC(8,_timeAndTimezone,UMCamel_TimeAndTimezone,o,p);
    GET_CONTEXT_SPECIFIC(9,_tPShortMessageSpecificInfo,UMCamel_TPShortMessageSpecificInfo,o,p);
    GET_CONTEXT_SPECIFIC(10,_tPProtocolIdentifier,UMCamel_TPProtocolIdentifier,o,p);
    GET_CONTEXT_SPECIFIC(11,_tPDataCodingScheme,UMCamel_TPDataCodingScheme,o,p);
    GET_CONTEXT_SPECIFIC(12,_tPValidityPeriod,UMCamel_TPValidityPeriod,o,p);
    GET_CONTEXT_SPECIFIC(13,_extensions,UMCamel_ExtensionsArray,o,p);

    while(o)
    {
        GET_CONTEXT_SPECIFIC_NOGRAB(14,_smsReferenceNumber,UMCamel_CallReferenceNumber,o,p);
        GET_CONTEXT_SPECIFIC_NOGRAB(15,_mscAddress,UMCamel_ISDN_AddressString,o,p);
        GET_CONTEXT_SPECIFIC_NOGRAB(16,_sgsnNumber,UMCamel_ISDN_AddressString,o,p);
        GET_CONTEXT_SPECIFIC_NOGRAB(17,_ms_Classmark2,UMCamel_MS_Classmark2,o,p);
        GET_CONTEXT_SPECIFIC_NOGRAB(18,_gPRSMSClass,UMCamel_GPRSMSClass,o,p);
        GET_CONTEXT_SPECIFIC_NOGRAB(19,_iMEI,UMCamel_IMEI,o,p);
        GET_CONTEXT_SPECIFIC_NOGRAB(20,_calledPartyNumberSMS,UMCamel_ISDN_AddressString,o,p)
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"InitialDPSMSArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    

    DICT_ADD(dict,_serviceKey,@"_serviceKey");
    DICT_ADD(dict,_destinationSubscriberNumber,@"_destinationSubscriberNumber");
    DICT_ADD(dict,_callingPartyNumberas,@"_callingPartyNumberas");
    DICT_ADD(dict,_eventTypeSMS,@"_eventTypeSMS");
    DICT_ADD(dict,_iMSI,@"_iMSI");
    DICT_ADD(dict,_locationInformationMSC,@"_locationInformationMSC");
    DICT_ADD(dict,_locationInformationGPRS,@"_locationInformationGPRS");
    DICT_ADD(dict,_sMSCAddress,@"_sMSCAddress");
    DICT_ADD(dict,_timeAndTimezone,@"_timeAndTimezone");
    DICT_ADD(dict,_tPShortMessageSpecificInfo,@"_tPShortMessageSpecificInfo");
    DICT_ADD(dict,_tPProtocolIdentifier,@"_tPProtocolIdentifier");
    DICT_ADD(dict,_tPDataCodingScheme,@"_tPDataCodingScheme");
    DICT_ADD(dict,_tPValidityPeriod,@"_tPValidityPeriod");
    DICT_ADD(dict,_extensions,@"_extensions");

    DICT_ADD(dict,_smsReferenceNumber,@"_smsReferenceNumber");
    DICT_ADD(dict,_mscAddress,@"_mscAddress");
    DICT_ADD(dict,_sgsnNumber,@"_sgsnNumber");
    DICT_ADD(dict,_ms_Classmark2,@"_ms_Classmark2");
    DICT_ADD(dict,_gPRSMSClass,@"_gPRSMSClass");
    DICT_ADD(dict,_iMEI,@"_iMEI");
    DICT_ADD(dict,_calledPartyNumberSMS,@"_calledPartyNumberSMS");
    
    return dict;
}

@end

