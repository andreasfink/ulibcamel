//
//  UMCamel_CallSegmentFailure.h
//  ulibcamel
//
//  Created by Andreas Fink on 30.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import "UMCamel_CallSegmentID.h"
#import "UMCamel_Cause.h"

@interface UMCamel_CallSegmentFailure : UMASN1Sequence
{
    UMCamel_CallSegmentID   *_callSegmentID;
    UMCamel_Cause           *_cause;
}

@property(readwrite,strong,atomic)  UMCamel_CallSegmentID   *callSegmentID;
@property(readwrite,strong,atomic)  UMCamel_Cause           *cause;

@end

