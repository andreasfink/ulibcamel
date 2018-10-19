//
//  UMCamel_Burst.h
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>


@interface UMCamel_Burst : UMASN1Sequence
{
	UMASN1Integer	*_numberOfBursts;
	UMASN1Integer	*_burstInterval;
	UMASN1Integer	*_numberOfTonesInBurst;
	UMASN1Integer	*_toneDuration;
	UMASN1Integer	*_toneInterval;
}

@property(readwrite,strong,atomic)	UMASN1Integer	*numberOfBursts;
@property(readwrite,strong,atomic)	UMASN1Integer	*burstInterval;
@property(readwrite,strong,atomic)	UMASN1Integer	*numberOfTonesInBurst;
@property(readwrite,strong,atomic)	UMASN1Integer	*toneDuration;
@property(readwrite,strong,atomic)	UMASN1Integer	*toneInterval;

@end

