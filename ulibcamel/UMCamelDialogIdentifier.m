//
//  UMCamelDialogIdentifier.m
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamelDialogIdentifier.h"

@implementation UMCamelDialogIdentifier

- (UMCamelDialogIdentifier *)initWithString:(NSString *)str
{
    self = [super initWithString:str];
    if(self)
    {
    }
    return self;
}

- (UMCamelDialogIdentifier *)initWithTcapUserDialogIdentifier:(UMTCAP_UserDialogIdentifier *)tcapUserDialogIdentifier
{
    self = [super init];
    if(self)
    {
        _dialogId = tcapUserDialogIdentifier.dialogId;
    }
    return self;
}

-(UMCamelDialogIdentifier *)copyWithZone:(nullable NSZone *)zone
{
    UMCamelDialogIdentifier *cpy = [[UMCamelDialogIdentifier allocWithZone:zone]init];
    cpy.dialogId = _dialogId;
    return cpy;
}

@end

