//
//  UMCamel_CallInformationRequestArg.h
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMCamel_RequestedInformationTypeList.h"
#import "UMCamel_ExtensionsArray.h"
#import "UMCamel_SendingSideID.h"

@interface UMCamel_CallInformationRequestArg : UMASN1Sequence
{
	UMCamel_RequestedInformationTypeList	*_requestedInformationTypeList;
	UMCamel_ExtensionsArray					*_extensions;
	UMCamel_SendingSideID					*_legID3;
}

@property(readwrite,strong,atomic)	UMCamel_RequestedInformationTypeList	*requestedInformationTypeList;
@property(readwrite,strong,atomic)	UMCamel_ExtensionsArray					*extensions;
@property(readwrite,strong,atomic)	UMCamel_SendingSideID					*legID3;

@end

NS_ASSUME_NONNULL_END
