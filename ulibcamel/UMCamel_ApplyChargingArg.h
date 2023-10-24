//
//  UMCamel_ApplyChargingArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 22.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import <ulibcamel/UMCamel_AChBillingChargingCharacteristics.h>
#import <ulibcamel/UMCamel_SendingSideID.h>
#import <ulibcamel/UMCamel_ExtensionsArray.h>
#import <ulibcamel/UMCamel_AChChargingAddress.h>

@interface UMCamel_ApplyChargingArg : UMASN1Sequence
{
    UMCamel_AChBillingChargingCharacteristics   *_aChBillingChargingCharacteristics;
    UMCamel_SendingSideID                       *_partyToCharge1;
    UMCamel_ExtensionsArray                     *_extensions;
    UMCamel_AChChargingAddress                  *_aChChargingAddress;

}

@property(readwrite,strong,atomic)  UMCamel_AChBillingChargingCharacteristics   *aChBillingChargingCharacteristics;
@property(readwrite,strong,atomic)  UMCamel_SendingSideID                       *partyToCharge1;
@property(readwrite,strong,atomic)  UMCamel_ExtensionsArray                     *extensions;
@property(readwrite,strong,atomic)  UMCamel_AChChargingAddress                  *aChChargingAddress;

@end
