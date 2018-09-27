//
//  UMCamel_InitialDPArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

#import "UMCamel_ServiceKey.h"
#import "UMCamel_CalledPartyNumber.h"
#import "UMCamel_CallingPartyNumber.h"
#import "UMCamel_CallingPartysCategory.h"
#import "UMCamel_CGEncountered.h"
#import "UMCamel_IPSSPCapabilities.h"
#import "UMCamel_LocationNumber.h"
#import "UMCamel_OriginalCalledPartyID.h"
#import "UMCamel_ExtensionsArray.h"
#import "UMCamel_HighLayerCompatibility.h"
#import "UMCamel_AdditionalCallingPartyNumber.h"
#import "UMCamel_BearerCapability.h"
#import "UMCamel_EventTypeBCSM.h"
#import "UMCamel_RedirectingPartyID.h"
#import "UMCamel_RedirectionInformation.h"
#import "UMCamel_Cause.h"
#import "UMCamel_ServiceInteractionIndicatorsTwo.h"
#import "UMCamel_Carrier.h"
#import "UMCamel_CUG_Index.h"
#import "UMCamel_CUG_Interlock.h"
#import "UMCamel_IMSI.h"
#import "UMCamel_SubscriberState.h"
#import "UMCamel_LocationInformation.h"
#import "UMCamel_Ext_BasicServiceCode.h"
#import "UMCamel_CallReferenceNumber.h"
#import "UMCamel_ISDN_AddressString.h"
#import "UMCamel_CalledPartyBCDNumber.h"
#import "UMCamel_TimeAndTimezone.h"
#import "UMCamel_InitialDPArgExtension.h"

@interface UMCamel_InitialDPArg : UMASN1Sequence
{
    UMCamel_ServiceKey                      *_serviceKey;
    UMCamel_CalledPartyNumber               *_calledPartyNumber;
    UMCamel_CallingPartyNumber              *_callingPartyNumber;
    UMCamel_CallingPartysCategory           *_callingPartysCategory;
    UMCamel_CGEncountered                   *_cGEncountered;
    UMCamel_IPSSPCapabilities               *_iPSSPCapabilities;
    UMCamel_LocationNumber                  *_locationNumber;
    UMCamel_OriginalCalledPartyID           *_originalCalledPartyID;
    UMCamel_ExtensionsArray                 *_extensions;
    UMCamel_HighLayerCompatibility          *_highLayerCompatibility;
    UMCamel_AdditionalCallingPartyNumber    *_additionalCallingPartyNumber;
    UMCamel_BearerCapability                *_bearerCapability;
    UMCamel_EventTypeBCSM                   *_eventTypeBCSM;
    UMCamel_RedirectingPartyID              *_redirectingPartyID;
    UMCamel_RedirectionInformation          *_redirectionInformation;
    UMCamel_Cause                           *_cause;
    UMCamel_ServiceInteractionIndicatorsTwo *_serviceInteractionIndicatorsTwo;
    UMCamel_Carrier                         *_carrier;
    UMCamel_CUG_Index                       *_cug_Index;
    UMCamel_CUG_Interlock                   *_cug_Interlock;
    BOOL                                    _cug_OutgoingAccess;
    UMCamel_IMSI                            *_iMSI;
    UMCamel_SubscriberState                 *_subscriberState;
    UMCamel_LocationInformation             *_locationInformation;
    UMCamel_Ext_BasicServiceCode            *_ext_basicServiceCode;
    UMCamel_CallReferenceNumber             *_callReferenceNumber;
    UMCamel_ISDN_AddressString              *_mscAddress;
    UMCamel_CalledPartyBCDNumber            *_calledPartyBCDNumber;
    UMCamel_TimeAndTimezone                 *_timeAndTimezone;
    BOOL                                    _gsm_ForwardingPending;
    UMCamel_InitialDPArgExtension           *_initialDPArgExtension;
}

@property(readwrite,strong,atomic)    UMCamel_ServiceKey                      *serviceKey;
@property(readwrite,strong,atomic)    UMCamel_CalledPartyNumber               *calledPartyNumber;
@property(readwrite,strong,atomic)    UMCamel_CallingPartyNumber              *callingPartyNumber;
@property(readwrite,strong,atomic)    UMCamel_CallingPartysCategory           *callingPartysCategory;
@property(readwrite,strong,atomic)    UMCamel_CGEncountered                   *cGEncountered;
@property(readwrite,strong,atomic)    UMCamel_IPSSPCapabilities               *iPSSPCapabilities;
@property(readwrite,strong,atomic)    UMCamel_LocationNumber                  *locationNumber;
@property(readwrite,strong,atomic)    UMCamel_OriginalCalledPartyID           *originalCalledPartyID;
@property(readwrite,strong,atomic)    UMCamel_ExtensionsArray                 *extensions;
@property(readwrite,strong,atomic)    UMCamel_HighLayerCompatibility          *highLayerCompatibility;
@property(readwrite,strong,atomic)    UMCamel_AdditionalCallingPartyNumber    *additionalCallingPartyNumber;
@property(readwrite,strong,atomic)    UMCamel_BearerCapability                *bearerCapability;
@property(readwrite,strong,atomic)    UMCamel_EventTypeBCSM                   *eventTypeBCSM;
@property(readwrite,strong,atomic)    UMCamel_RedirectingPartyID              *redirectingPartyID;
@property(readwrite,strong,atomic)    UMCamel_RedirectionInformation          *redirectionInformation;
@property(readwrite,strong,atomic)    UMCamel_Cause                           *cause;
@property(readwrite,strong,atomic)    UMCamel_ServiceInteractionIndicatorsTwo *serviceInteractionIndicatorsTwo;
@property(readwrite,strong,atomic)    UMCamel_Carrier                         *carrier;
@property(readwrite,strong,atomic)    UMCamel_CUG_Index                       *cug_Index;
@property(readwrite,strong,atomic)    UMCamel_CUG_Interlock                   *cug_Interlock;
@property(readwrite,assign,atomic)    BOOL                                    cug_OutgoingAccess;
@property(readwrite,strong,atomic)    UMCamel_IMSI                            *iMSI;
@property(readwrite,strong,atomic)    UMCamel_SubscriberState                 *subscriberState;
@property(readwrite,strong,atomic)    UMCamel_LocationInformation             *locationInformation;
@property(readwrite,strong,atomic)    UMCamel_Ext_BasicServiceCode            *ext_basicServiceCode;
@property(readwrite,strong,atomic)    UMCamel_CallReferenceNumber             *callReferenceNumber;
@property(readwrite,strong,atomic)    UMCamel_ISDN_AddressString              *mscAddress;
@property(readwrite,strong,atomic)    UMCamel_CalledPartyBCDNumber            *calledPartyBCDNumber;
@property(readwrite,strong,atomic)    UMCamel_TimeAndTimezone                 *timeAndTimezone;
@property(readwrite,assign,atomic)    BOOL                                    gsm_ForwardingPending;
@property(readwrite,strong,atomic)    UMCamel_InitialDPArgExtension           *initialDPArgExtension;

@end
