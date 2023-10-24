//
//  UMCamel_AOCGprs.h
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibcamel/UMCamel_CAI_Gsm0224.h>
#import <ulibcamel/UMCamel_AOCSubsequent.h>

@interface UMCamel_AOCGprs : UMASN1Sequence
{
	UMCamel_CAI_Gsm0224 	*_al;
	UMCamel_AOCSubsequent 	*_aOCSubsequent;
}

@property(readwrite,strong,atomic)	UMCamel_CAI_Gsm0224 *al;
@property(readwrite,strong,atomic)	UMCamel_AOCSubsequent *aOCSubsequent;

@end
