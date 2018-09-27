//
//  UMCamelUserIdentifier.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

@interface UMCamelUserIdentifier : UMObject
{
    NSString *_userIdentifier;
}

@property(readwrite,strong) NSString *userIdentifier;

- (UMCamelUserIdentifier *)initWithString:(NSString *)str;
- (id)proxyForJson;

@end


