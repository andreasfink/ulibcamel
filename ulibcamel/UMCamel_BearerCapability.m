//
//  UMCamel_BearerCapability.m
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_BearerCapability.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_BearerCapability


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	CONTEXT_SPECIFIC_ADD(0,_bearerCap);
}

- (UMCamel_BearerCapability *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	
	GET_CONTEXT_SPECIFIC(0,_bearerCap,UMCamel_BearerCap,o,p);
	return self;
}

- (NSString *) objectName
{
	return @"BearerCapability";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	DICT_ADD(dict,_bearerCap,@"bearerCap");
	return dict;
}

@end
