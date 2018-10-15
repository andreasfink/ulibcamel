//
//  UMCamelInvoke.h
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>


@interface UMCamelInvoke : UMASN1Sequence
{
    int64_t   _invokeId;
    int64_t   _opCode;
    UMASN1Sequence  *_params;
    NSString *_opCodeName;
}
@end
