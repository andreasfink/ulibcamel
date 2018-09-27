//
//  UMCamel_InitialDPSMSArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import "UMCamel_ServiceKey.h"
#import "UMCamel_CalledPartyBCDNumber.h"
#import "UMCamel_SMS_AddressString.h"
#import "UMCamel_EventTypeSMS.h"
#import "UMCamel_IMSI.h"
#import "UMCamel_LocationInformation.h"
#import "UMCamel_LocationInformationGPRS.h"
#import "UMCamel_ISDN_AddressString.h"
#import "UMCamel_TimeAndTimezone.h"
#import "UMCamel_TPShortMessageSpecificInfo.h"
#import "UMCamel_TPProtocolIdentifier.h"
#import "UMCamel_TPDataCodingScheme.h"
#import "UMCamel_TPValidityPeriod.h"
#import "UMCamel_ExtensionsArray.h"
#import "UMCamel_CallReferenceNumber.h"
#import "UMCamel_MS_Classmark2.h"
#import "UMCamel_GPRSMSClass.h"
#import "UMCamel_IMEI.h"

@interface UMCamel_InitialDPSMSArg : UMASN1Sequence
{
    UMCamel_ServiceKey                  *_serviceKey;
    UMCamel_CalledPartyBCDNumber        *_destinationSubscriberNumber;
    UMCamel_SMS_AddressString           *_callingPartyNumberas;
    UMCamel_EventTypeSMS                *_eventTypeSMS;
    UMCamel_IMSI                        *_iMSI;
    UMCamel_LocationInformation         *_locationInformationMSC;
    UMCamel_LocationInformationGPRS     *_locationInformationGPRS;
    UMCamel_ISDN_AddressString          *_sMSCAddress;
    UMCamel_TimeAndTimezone             *_timeAndTimezone;
    UMCamel_TPShortMessageSpecificInfo  *_tPShortMessageSpecificInfo;
    UMCamel_TPProtocolIdentifier        *_tPProtocolIdentifier;
    UMCamel_TPDataCodingScheme          *_tPDataCodingScheme;
    UMCamel_TPValidityPeriod            *_tPValidityPeriod;
    UMCamel_ExtensionsArray             *_extensions;
    UMCamel_CallReferenceNumber         *_smsReferenceNumber;
    UMCamel_ISDN_AddressString          *_mscAddress;
    UMCamel_ISDN_AddressString          *_sgsnNumber;
    UMCamel_MS_Classmark2               *_ms_Classmark2;
    UMCamel_GPRSMSClass                 *_gPRSMSClass;
    UMCamel_IMEI                        *_iMEI;
    UMCamel_ISDN_AddressString          *_calledPartyNumberSMS;
}

@property(readwrite,strong,atomic)    UMCamel_ServiceKey                  *serviceKey;
@property(readwrite,strong,atomic)    UMCamel_CalledPartyBCDNumber        *destinationSubscriberNumber;
@property(readwrite,strong,atomic)    UMCamel_SMS_AddressString           *callingPartyNumberas;
@property(readwrite,strong,atomic)    UMCamel_EventTypeSMS                *eventTypeSMS;
@property(readwrite,strong,atomic)    UMCamel_IMSI                        *iMSI;
@property(readwrite,strong,atomic)    UMCamel_LocationInformation         *locationInformationMSC;
@property(readwrite,strong,atomic)    UMCamel_LocationInformationGPRS     *locationInformationGPRS;
@property(readwrite,strong,atomic)    UMCamel_ISDN_AddressString          *sMSCAddress;
@property(readwrite,strong,atomic)    UMCamel_TimeAndTimezone             *timeAndTimezone;
@property(readwrite,strong,atomic)    UMCamel_TPShortMessageSpecificInfo  *tPShortMessageSpecificInfo;
@property(readwrite,strong,atomic)    UMCamel_TPProtocolIdentifier        *tPProtocolIdentifier;
@property(readwrite,strong,atomic)    UMCamel_TPDataCodingScheme          *tPDataCodingScheme;
@property(readwrite,strong,atomic)    UMCamel_TPValidityPeriod            *tPValidityPeriod;
@property(readwrite,strong,atomic)    UMCamel_ExtensionsArray             *extensions;
@property(readwrite,strong,atomic)    UMCamel_CallReferenceNumber         *smsReferenceNumber;
@property(readwrite,strong,atomic)    UMCamel_ISDN_AddressString          *mscAddress;
@property(readwrite,strong,atomic)    UMCamel_ISDN_AddressString          *sgsnNumber;
@property(readwrite,strong,atomic)    UMCamel_MS_Classmark2               *ms_Classmark2;
@property(readwrite,strong,atomic)    UMCamel_GPRSMSClass                 *gPRSMSClass;
@property(readwrite,strong,atomic)    UMCamel_IMEI                        *iMEI;
@property(readwrite,strong,atomic)    UMCamel_ISDN_AddressString          *calledPartyNumberSMS;

@end
