//
//  UMCamel_CAI_Gsm0224.h
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

@interface UMCamel_CAI_Gsm0224 : UMASN1Sequence

{
	UMASN1Integer *_e1;
	UMASN1Integer *_e2;
	UMASN1Integer *_e3;
	UMASN1Integer *_e4;
	UMASN1Integer *_e5;
	UMASN1Integer *_e6;
	UMASN1Integer *_e7;
}

@property(readwrite,strong,atomic)      UMASN1Integer *e1;
@property(readwrite,strong,atomic)      UMASN1Integer *e2;
@property(readwrite,strong,atomic)      UMASN1Integer *e3;
@property(readwrite,strong,atomic)      UMASN1Integer *e4;
@property(readwrite,strong,atomic)      UMASN1Integer *e5;
@property(readwrite,strong,atomic)      UMASN1Integer *e6;
@property(readwrite,strong,atomic)      UMASN1Integer *e7;

@end

