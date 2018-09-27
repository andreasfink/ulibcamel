//
//  UMCamelOperation.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMCamelOperationCode.h"
@interface UMCamelOperation : UMASN1Object
{
    UMCamelOperationCode _operation;
    int64_t _family;
    BOOL    _national;
}


@property (readwrite,assign) UMCamelOperationCode    operation;
@property (readwrite,assign) int64_t    family;
@property (readwrite,assign) BOOL       national;
- (UMCamelOperation *)initWithOperationCode:(UMCamelOperationCode)op;
- (NSString *)description;

@end

