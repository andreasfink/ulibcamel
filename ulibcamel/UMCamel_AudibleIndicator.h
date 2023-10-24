//
//  UMCamel_AudibleIndicator.h
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibcamel/UMCamel_BurstList.h>

@interface UMCamel_AudibleIndicator : UMASN1Choice
{
	UMASN1Boolean		*_istone;
	UMCamel_BurstList	*_burstList;
}

@property(readwrite,strong,atomic)	UMASN1Boolean		*istone;
@property(readwrite,strong,atomic)	UMCamel_BurstList	*burstList;

@end
