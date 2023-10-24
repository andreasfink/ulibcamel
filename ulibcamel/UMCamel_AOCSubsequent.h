//
//  UMCamel_AOCSubsequent.h
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibcamel/UMCamel_CAI_Gsm0224.h>

@interface UMCamel_AOCSubsequent : UMASN1Sequence
{
	UMCamel_CAI_Gsm0224		*_cAI_GSM0224;
	UMASN1Integer			*_tariffSwitchInterval;
}

@property(readwrite,strong,atomic)  UMCamel_CAI_Gsm0224		*cAI_GSM0224;
@property(readwrite,strong,atomic)  UMASN1Integer			*tariffSwitchInterval;

@end


