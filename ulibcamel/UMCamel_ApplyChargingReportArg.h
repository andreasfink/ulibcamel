//
//  UMCamel_ApplyChargingReportArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 22.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

@class UMCamel_CAMEL_CallResult;

@interface UMCamel_ApplyChargingReportArg : UMASN1Sequence
{
    UMCamel_CAMEL_CallResult    *_callresultOctet;
}
@property(readwrite,strong,atomic)      UMCamel_CAMEL_CallResult    *callresultOctet;
@end

