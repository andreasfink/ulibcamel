//
//  UMCamel_EstablishTemporaryConnectionArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 03.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

#import "UMCamel_AssistingSSPIPRoutingAddress.h"
#import "UMCamel_CorrelationID.h"
#import "UMCamel_ScfID.h"
#import "UMCamel_ExtensionsArray.h"
#import "UMCamel_Carrier.h"
#import "UMCamel_ServiceInteractionIndicatorsTwo.h"
#import "UMCamel_CallSegmentID.h"
#import "UMCamel_NAOliInfo.h"
#import "UMCamel_ChargeNumber.h"
#import "UMCamel_OriginalCalledPartyID.h"
#import "UMCamel_CallingPartyNumber.h"

@interface UMCamel_EstablishTemporaryConnectionArg : UMASN1Sequence
{
    UMCamel_AssistingSSPIPRoutingAddress *_assistingSSPIPRoutingAddress;
    UMCamel_CorrelationID *_correlationID;
    UMCamel_ScfID *_scfID;
    UMCamel_ExtensionsArray *_extensions;
    UMCamel_Carrier *_carrier;
    UMCamel_ServiceInteractionIndicatorsTwo *_serviceInteractionIndicatorsTwo;
    UMCamel_CallSegmentID *_callSegmentID;
    UMCamel_NAOliInfo *_naOliInfo;
    UMCamel_ChargeNumber *_chargeNumber ;
    UMCamel_OriginalCalledPartyID *_originalCalledPartyID;
    UMCamel_CallingPartyNumber *_callingPartyNumber;
}

@property(readwrite,strong,atomic)  UMCamel_AssistingSSPIPRoutingAddress *assistingSSPIPRoutingAddress;
@property(readwrite,strong,atomic)  UMCamel_CorrelationID *correlationID;
@property(readwrite,strong,atomic)  UMCamel_ScfID *scfID;
@property(readwrite,strong,atomic)  UMCamel_ExtensionsArray *extensions;
@property(readwrite,strong,atomic)  UMCamel_Carrier *carrier;
@property(readwrite,strong,atomic)  UMCamel_ServiceInteractionIndicatorsTwo *serviceInteractionIndicatorsTwo;
@property(readwrite,strong,atomic)  UMCamel_CallSegmentID *callSegmentID;
@property(readwrite,strong,atomic)  UMCamel_NAOliInfo *naOliInfo;
@property(readwrite,strong,atomic)  UMCamel_ChargeNumber *chargeNumber ;
@property(readwrite,strong,atomic)  UMCamel_OriginalCalledPartyID *originalCalledPartyID;
@property(readwrite,strong,atomic)  UMCamel_CallingPartyNumber *callingPartyNumber;

@end
