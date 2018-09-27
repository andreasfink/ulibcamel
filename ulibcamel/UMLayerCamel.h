//
//  UMLayerCamel.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>
#import "UMCamelProviderProtocol.h"
#import "UMCamelUserProtocol.h"
#import "UMCamelDialogIdentifier.h"
#import "UMCamelDialog.h"

@interface UMLayerCamel : UMLayer<UMTCAP_UserProtocol,UMCamelProviderProtocol>
{
    UMMutex *_dialogIdLock;
    UMSynchronizedDictionary *_dialogs;
    id<UMCamelUserProtocol> _user;

}
@end
