//
//  UMCamel_BurstList.h
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibcamel/UMCamel_Burst.h>

@interface UMCamel_BurstList : UMASN1Sequence
{
	UMASN1Integer	*_warningPeriod;
	UMCamel_Burst	*_bursts;
}
@property(readwrite,strong,atomic)	UMASN1Integer	*warningPeriod;
@property(readwrite,strong,atomic)	UMCamel_Burst	*bursts;

@end

