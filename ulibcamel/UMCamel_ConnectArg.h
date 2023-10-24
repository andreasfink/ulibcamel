//
//  UMCamel_ConnectArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import <ulibcamel/UMCamel_DestinationRoutingAddress.h>
#import <ulibcamel/UMCamel_AlertingPattern.h>
#import <ulibcamel/UMCamel_OriginalCalledPartyID.h>
#import <ulibcamel/UMCamel_ExtensionsArray.h>
#import <ulibcamel/UMCamel_Carrier.h>
#import <ulibcamel/UMCamel_CallingPartysCategory.h>
#import <ulibcamel/UMCamel_RedirectingPartyID.h>
#import <ulibcamel/UMCamel_RedirectionInformation.h>
#import <ulibcamel/UMCamel_GenericNumbers.h>
#import <ulibcamel/UMCamel_ServiceInteractionIndicatorsTwo.h>
#import <ulibcamel/UMCamel_ChargeNumber.h>
#import <ulibcamel/UMCamel_LegID.h>
#import <ulibcamel/UMCamel_CUG_Interlock.h>
#import <ulibcamel/UMCamel_SuppressionOfAnnouncement.h>
#import <ulibcamel/UMCamel_OCSIApplicable.h>
#import <ulibcamel/UMCamel_NAOliInfo.h>

@interface UMCamel_ConnectArg : UMASN1Sequence
{
    UMCamel_DestinationRoutingAddress       *_destinationRoutingAddress;
    UMCamel_AlertingPattern                 *_alertingPattern;
    UMCamel_OriginalCalledPartyID           *_originalCalledPartyID;
    UMCamel_ExtensionsArray                 *_extensions;
    UMCamel_Carrier                         *_carrier;
    UMCamel_CallingPartysCategory           *_callingPartysCategory;
    UMCamel_RedirectingPartyID              *_redirectingPartyID;
    UMCamel_RedirectionInformation          *_redirectionInformation;
    UMCamel_GenericNumbers                  *_genericNumbers;
    UMCamel_ServiceInteractionIndicatorsTwo *_serviceInteractionIndicatorsTwo;
    UMCamel_ChargeNumber                    *_chargeNumber;
    UMCamel_LegID                           *_legToBeConnected;
    UMCamel_CUG_Interlock                   *_cug_Interlock;
    BOOL                                    _cug_OutgoingAccess;
    UMCamel_SuppressionOfAnnouncement       *_suppressionOfAnnouncement;
    UMCamel_OCSIApplicable                  *_oCSIApplicable;
    UMCamel_NAOliInfo                       *_naOliInfo;
    BOOL                                    _bor_InterrogationRequested;
    BOOL                                    _suppress_N_CSI;
}

@property(readwrite,strong,atomic)    UMCamel_DestinationRoutingAddress       *destinationRoutingAddress;
@property(readwrite,strong,atomic)    UMCamel_AlertingPattern                 *alertingPattern;
@property(readwrite,strong,atomic)    UMCamel_OriginalCalledPartyID           *originalCalledPartyID;
@property(readwrite,strong,atomic)    UMCamel_ExtensionsArray                 *extensions;
@property(readwrite,strong,atomic)    UMCamel_Carrier                         *carrier;
@property(readwrite,strong,atomic)    UMCamel_CallingPartysCategory           *callingPartysCategory;
@property(readwrite,strong,atomic)    UMCamel_RedirectingPartyID              *redirectingPartyID;
@property(readwrite,strong,atomic)    UMCamel_RedirectionInformation          *redirectionInformation;
@property(readwrite,strong,atomic)    UMCamel_GenericNumbers                  *genericNumbers;
@property(readwrite,strong,atomic)    UMCamel_ServiceInteractionIndicatorsTwo *serviceInteractionIndicatorsTwo;
@property(readwrite,strong,atomic)    UMCamel_ChargeNumber                    *chargeNumber;
@property(readwrite,strong,atomic)    UMCamel_LegID                           *legToBeConnected;
@property(readwrite,strong,atomic)    UMCamel_CUG_Interlock                   *cug_Interlock;
@property(readwrite,assign,atomic)    BOOL                                    cug_OutgoingAccess;
@property(readwrite,strong,atomic)    UMCamel_SuppressionOfAnnouncement       *suppressionOfAnnouncement;
@property(readwrite,strong,atomic)    UMCamel_OCSIApplicable                  *oCSIApplicable;
@property(readwrite,strong,atomic)    UMCamel_NAOliInfo                       *naOliInfo;
@property(readwrite,assign,atomic)    BOOL                                    bor_InterrogationRequested;
@property(readwrite,assign,atomic)    BOOL                                    suppress_N_CSI;

@end

