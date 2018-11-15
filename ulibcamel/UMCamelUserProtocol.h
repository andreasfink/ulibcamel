//
//  UMCamelUserProtocol.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulib/ulib.h>
#import "UMCamelUserIdentifier.h"

@protocol UMCamelUserProtocol <NSObject>

- (UMCamelUserIdentifier *)getNewCamelUserIdentifier;
@end

