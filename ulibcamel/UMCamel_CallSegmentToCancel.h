//
//  UMCamel_CallSegmentToCancel.h
//  ulibcamel
//
//  Created by Andreas Fink on 30.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMCamel_InvokeID.h"
#import "UMCamel_CallSegmentID.h"

@interface UMCamel_CallSegmentToCancel : UMASN1Sequence
{
    UMCamel_InvokeID        *_callInvokeID;
    UMCamel_CallSegmentID   *_callSegmentID;
}

@property(readwite,strong,atomic)   UMCamel_InvokeID        *callInvokeID;
@property(readwite,strong,atomic)   UMCamel_CallSegmentID   *callSegmentID;

@end

