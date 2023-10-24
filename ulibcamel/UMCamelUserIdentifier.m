//
//  UMCamelUserIdentifier.m
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamelUserIdentifier.h>

@implementation UMCamelUserIdentifier

- (UMCamelUserIdentifier *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        _userIdentifier = str;
    }
    return self;
}

- (NSString *)description
{
    return _userIdentifier;
}

-(UMCamelUserIdentifier *)copyWithZone:(nullable NSZone *)zone
{
    UMCamelUserIdentifier *cpy = [[UMCamelUserIdentifier allocWithZone:zone]init];
    cpy.userIdentifier = _userIdentifier;
    return cpy;
}

- (id)proxyForJson
{
    return _userIdentifier;
}

@end

