//
//  UMCamelObject.h
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

@class UMCamelInvoke;

@interface UMCamelObject : UMASN1Choice
{
    UMCamelInvoke *_invoke;
}
@end

