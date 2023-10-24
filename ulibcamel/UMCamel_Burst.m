//
//  UMCamel_Burst.m
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_Burst.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_Burst


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	CONTEXT_SPECIFIC_ADD(0,_numberOfBursts);
	CONTEXT_SPECIFIC_ADD(1,_burstInterval);
	CONTEXT_SPECIFIC_ADD(2,_numberOfTonesInBurst);
	CONTEXT_SPECIFIC_ADD(3,_toneDuration);
	CONTEXT_SPECIFIC_ADD(4,_toneInterval);
}

- (UMCamel_Burst *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	
	GET_CONTEXT_SPECIFIC(0,_numberOfBursts,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(1,_burstInterval,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(2,_numberOfTonesInBurst,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(3,_toneDuration,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(4,_toneInterval,UMASN1Integer,o,p);
	return self;
}

- (NSString *) objectName
{
	return @"Burst";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	DICT_ADD(dict,_numberOfBursts,@"numberOfBursts");
	DICT_ADD(dict,_burstInterval,@"burstInterval");
	DICT_ADD(dict,_numberOfTonesInBurst,@"numberOfTonesInBurst");
	DICT_ADD(dict,_toneDuration,@"toneDuration");
	DICT_ADD(dict,_toneInterval,@"toneInterval");
	return dict;
}

@end
