//
//  UMCamel_CallGapArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 22.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import <ulibcamel/UMCamel_GapCriteria.h>
#import <ulibcamel/UMCamel_GapIndicators.h>
#import <ulibcamel/UMCamel_ControlType.h>
#import <ulibcamel/UMCamel_GapTreatment.h>
#import <ulibcamel/UMCamel_ExtensionsArray.h>
@interface UMCamel_CallGapArg : UMASN1Sequence
{
    UMCamel_GapCriteria     *_gapCriteria;
    UMCamel_GapIndicators   *_gapIndicators;
    UMCamel_ControlType     *_controlType;
    UMCamel_GapTreatment    *_gapTreatment;
    UMCamel_ExtensionsArray *_extensions;
}
@property(readwrite,strong,atomic)  UMCamel_GapCriteria     *gapCriteria;
@property(readwrite,strong,atomic)  UMCamel_GapIndicators   *gapIndicators;
@property(readwrite,strong,atomic)  UMCamel_ControlType     *controlType;
@property(readwrite,strong,atomic)  UMCamel_GapTreatment    *gapTreatment;
@property(readwrite,strong,atomic)  UMCamel_ExtensionsArray *extensions;

@end

