//
//  UMCamel_ACTimeDurationCharging.h
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import <ulibcamel/UMCamel_ExtensionsArray.h>

@interface UMCamel_ACTimeDurationCharging : UMASN1Sequence
{
    UMASN1Integer *_maxCallPeriodDuration;
    UMASN1Boolean *_releaseIfdurationExceeded;
    UMASN1Integer *_tariffSwitchInterval;
    UMASN1Boolean *_actone;
    UMCamel_ExtensionsArray *_extensions;
}

@property(readwrite,strong,atomic)  UMASN1Integer *maxCallPeriodDuration;
@property(readwrite,strong,atomic)  UMASN1Boolean *releaseIfdurationExceeded;
@property(readwrite,strong,atomic)  UMASN1Integer *tariffSwitchInterval;
@property(readwrite,strong,atomic)  UMASN1Boolean *actone;
@property(readwrite,strong,atomic)  UMCamel_ExtensionsArray *extensions;

@end
