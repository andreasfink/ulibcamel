//
//  UMCamel_DisconnectForwardConnectionWithArgumentArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/ulibgsmmap.h>

#import <ulibcamel/UMCamel_CallSegmentID.h>
#import <ulibcamel/UMCamel_ExtensionsArray.h>

@interface UMCamel_DisconnectForwardConnectionWithArgumentArg : UMASN1Sequence
{
    UMCamel_CallSegmentID *_callSegmentID;
    UMCamel_ExtensionsArray *_extensions;
}

@property(readwrite,strong,atomic)  UMCamel_CallSegmentID   *callSegmentID;
@property(readwrite,strong,atomic)  UMCamel_ExtensionsArray *extensions;

@end


