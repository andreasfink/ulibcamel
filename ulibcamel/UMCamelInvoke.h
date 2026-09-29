//
//  UMCamelInvoke.h
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/ulibgsmmap.h>


@interface UMCamelInvoke : UMASN1Sequence
{
    UMASN1Integer  *_invokeId;
    UMASN1Integer  *_opCode;
    UMASN1Object   *_params;
    NSString 	   *_opCodeName;
}

@property(readwrite,atomic,strong)	UMASN1Integer  *invokeId;
@property(readwrite,atomic,strong)	UMASN1Integer  *opCode;
@property(readwrite,atomic,strong)	UMASN1Object   *params;
@property(readwrite,atomic,strong)	NSString 	   *opCodeName;

@end
