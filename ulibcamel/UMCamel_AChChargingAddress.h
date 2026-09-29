//
//  UMCamel_AChChargingAddress.h
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/ulibgsmmap.h>
#import <ulibcamel/UMCamel_LegID.h>
#import <ulibcamel/UMCamel_CallSegmentID.h>


@interface UMCamel_AChChargingAddress : UMASN1Choice
{
    UMCamel_LegID           *_legID;
    UMCamel_CallSegmentID   *_srfConnection;
}
@property(readwrite,strong,atomic)      UMCamel_LegID           *legID;
@property(readwrite,strong,atomic)      UMCamel_CallSegmentID   *srfConnection;

@end

