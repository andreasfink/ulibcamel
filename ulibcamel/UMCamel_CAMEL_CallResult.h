//
//  UMCamel_CAMEL_CallResult.h
//  ulibcamel
//
//  Created by Andreas Fink on 30.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import "UMCamel_TimeDurationChargingResult.h"

@interface UMCamel_CAMEL_CallResult : UMASN1Choice
{
    UMCamel_TimeDurationChargingResult    *_timeDurationChargingResult;
    BOOL                                   _void99;
}

@property(readwrite,strong,atomic)  UMCamel_TimeDurationChargingResult *timeDurationChargingResult;
@property(readwrite,assign,atomic)  BOOL void99;
@end


