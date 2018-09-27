//
//  UMCamelDialogIdentifier.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>


@interface UMCamelDialogIdentifier : UMTCAP_UserDialogIdentifier
{
    
}

- (UMCamelDialogIdentifier *)initWithString:(NSString *)str;
- (UMCamelDialogIdentifier *)initWithTcapUserDialogIdentifier:(UMTCAP_UserDialogIdentifier *)tcapUserDialogIdentifier;
- (UMCamelDialogIdentifier *)copyWithZone:(NSZone *)zone;

@end

