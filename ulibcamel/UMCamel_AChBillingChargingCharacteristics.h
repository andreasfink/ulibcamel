//
//  UMCamel_AChBillingChargingCharacteristics.h
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/ulibgsmmap.h>
#import <ulibcamel/UMCamel_ExtensionsArray.h>
#import <ulibcamel/UMCamel_ACTimeDurationCharging.h>

@interface UMCamel_AChBillingChargingCharacteristics : UMASN1Choice
{
    UMCamel_ACTimeDurationCharging *_actimeDurationCharging;
}

@property(readwrite,strong,atomic)      UMCamel_ACTimeDurationCharging *actimeDurationCharging;

@end
