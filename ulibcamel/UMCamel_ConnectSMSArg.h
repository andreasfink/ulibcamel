//
//  UMCamel_ConnectSMSArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibcamel/UMCamel_SMS_AddressString.h>
#import <ulibcamel/UMCamel_CalledPartyBCDNumber.h>
#import <ulibcamel/UMCamel_ISDN_AddressString.h>


@interface UMCamel_ConnectSMSArg : UMASN1Sequence
{
    UMCamel_SMS_AddressString       *_callingPartysNumber;
    UMCamel_CalledPartyBCDNumber    *_destinationSubscriberNumber;
    UMCamel_ISDN_AddressString      *_sMSCAddress;
}

@property(readwrite,strong,atomic)  UMCamel_SMS_AddressString       *callingPartysNumber;
@property(readwrite,strong,atomic)  UMCamel_CalledPartyBCDNumber    *destinationSubscriberNumber;
@property(readwrite,strong,atomic)  UMCamel_ISDN_AddressString      *sMSCAddress;

@end


