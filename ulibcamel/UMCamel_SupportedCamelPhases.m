//
//  UMCamel_SupportedCamelPhases.m
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_SupportedCamelPhases.h>

@implementation UMCamel_SupportedCamelPhases


- (void)setBitStringDefinition
{
    /* this is overridden normally */
    /* this metod should _bitStringDefintionBitToName to a dictionary stringValue -> @(number) */
    
    _bitStringDefintionBitToName = @{
        @(0) : @"phase1" ,
        @(1) : @"phase2" ,
        @(2) : @"phase3" ,
        @(3) : @"phase4" ,
    };
    _bitStringDefintionNameToBit = @{
        @"phase1" : @(0) ,
        @"phase2" : @(1) ,
        @"phase3" : @(2) ,
        @"phase4" : @(3) ,
    };
    
}


@end
