//
//  UMCamel_BurstList.m
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_BurstList.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_BurstList

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	CONTEXT_SPECIFIC_ADD(0,_warningPeriod);
	CONTEXT_SPECIFIC_ADD(1,_bursts);
}

- (UMCamel_BurstList *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	
	GET_CONTEXT_SPECIFIC(0,_warningPeriod,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(1,_bursts,UMCamel_Burst,o,p);
	return self;
}

- (NSString *) objectName
{
	return @"BurstList";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	DICT_ADD(dict,_warningPeriod,@"warningPeriod");
	DICT_ADD(dict,_bursts,@"bursts");
	return dict;
}

@end
