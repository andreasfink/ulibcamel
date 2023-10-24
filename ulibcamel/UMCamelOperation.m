//
//  UMCamelOperation.m
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamelOperation.h>

@implementation UMCamelOperation

- (UMCamelOperation *)initWithOperationCode:(UMCamelOperationCode)op
{
    self = [super init];
    if(self)
    {
        _operation = op;
    }
    return self;
}

- (NSString *)description
{
    if((_family == 0) && (_national == NO))
    {
        return [NSString stringWithFormat:@"%ld",(long)_operation];
    }
    return [NSString stringWithFormat:@"{ operation: %ld, family: %ld, national: %@ }",
            (long)_operation,
            (long)_family,
            (_national ? @"YES" : @"NO")];
}
@end
