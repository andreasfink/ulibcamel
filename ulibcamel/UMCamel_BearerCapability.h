//
//  UMCamel_BearerCapability.h
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMCamel_BearerCap.h"


@interface UMCamel_BearerCapability : UMASN1Choice
{
	UMCamel_BearerCap *_bearerCap;
}
@property(readwrite,strong,atomic)      UMCamel_BearerCap *bearerCap;

@end
