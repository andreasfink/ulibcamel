//
//  UMCamel_AudibleIndicator.m
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_AudibleIndicator.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_AudibleIndicator

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	
	if(_istone)
	{
		[_asn1_list addObject:_istone];
	}
	CONTEXT_SPECIFIC_ADD(1,_burstList);
}

- (UMCamel_AudibleIndicator *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_boolean) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		_istone = [[UMASN1Boolean alloc]initWithASN1Object:o context:context]; \
		o = [self getObjectAtPosition:p++]; \
	}
	GET_CONTEXT_SPECIFIC(1,_burstList,UMCamel_BurstList,o,p);
	return self;
}

- (NSString *) objectName
{
	return @"AudibleIndicator";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	
	DICT_ADD(dict,_istone,@"istone");
	DICT_ADD(dict,_burstList,@"burstList");
	return dict;
}

@end
