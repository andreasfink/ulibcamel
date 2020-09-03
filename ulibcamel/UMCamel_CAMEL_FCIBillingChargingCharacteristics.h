//
//  UMCamel_CAMEL_FCIBillingChargingCharacteristics.h
//  ulibcamel
//
//  Created by Andreas Fink on 02.09.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMCamel_FreeFormatData.h"
#import "UMCamel_SendingSideID.h"
#import "UMCamel_AppendFreeFormatData.h"

@interface UMCamel_CAMEL_FCIBillingChargingCharacteristics : UMASN1Sequence
{
    UMCamel_FreeFormatData *_freeFormatData;
    UMCamel_SendingSideID *_partyToCharge4;
    UMCamel_AppendFreeFormatData *_appendFreeFormatData;
}


@property(readwrite,strong,atomic)  UMCamel_FreeFormatData *freeFormatData;
@property(readwrite,strong,atomic)  UMCamel_SendingSideID *partyToCharge4;
@property(readwrite,strong,atomic)  UMCamel_AppendFreeFormatData *appendFreeFormatData;

@end

