//
//  UMCamel_AssistRequestInstructionsArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 03.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

#import "UMCamel_CorrelationID.h"
#import "UMCamel_IPSSPCapabilities.h"
#import "UMCamel_ExtensionsArray.h"

@interface UMCamel_AssistRequestInstructionsArg : UMASN1Sequence
{
    UMCamel_CorrelationID       *_correlationID;
    UMCamel_IPSSPCapabilities   *_iPSSPCapabilities;
    UMCamel_ExtensionsArray     *_extensions;
}

@property(readwrite,strong,atomic)  UMCamel_CorrelationID       *correlationID;
@property(readwrite,strong,atomic)  UMCamel_IPSSPCapabilities   *iPSSPCapabilities;
@property(readwrite,strong,atomic)  UMCamel_ExtensionsArray     *extensions;

@end

