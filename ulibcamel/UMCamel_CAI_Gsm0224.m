//
//  UMCamel_CAI_Gsm0224.m
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_CAI_Gsm0224.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_CAI_Gsm0224



- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	CONTEXT_SPECIFIC_ADD(0,_e1);
	CONTEXT_SPECIFIC_ADD(1,_e2);
	CONTEXT_SPECIFIC_ADD(2,_e3);
	CONTEXT_SPECIFIC_ADD(3,_e4);
	CONTEXT_SPECIFIC_ADD(4,_e5);
	CONTEXT_SPECIFIC_ADD(5,_e6);
	CONTEXT_SPECIFIC_ADD(6,_e7);
}


- (UMCamel_CAI_Gsm0224 *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	
	GET_CONTEXT_SPECIFIC(0,_e1,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(1,_e2,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(2,_e3,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(3,_e4,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(4,_e5,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(5,_e6,UMASN1Integer,o,p);
	GET_CONTEXT_SPECIFIC(6,_e7,UMASN1Integer,o,p);
	return self;
}

- (NSString *) objectName
{
	return @"AOCBeforeAnswer";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	DICT_ADD(dict,_e1,@"e1");
	DICT_ADD(dict,_e2,@"e2");
	DICT_ADD(dict,_e3,@"e3");
	DICT_ADD(dict,_e4,@"e4");
	DICT_ADD(dict,_e5,@"e5");
	DICT_ADD(dict,_e6,@"e6");
	DICT_ADD(dict,_e7,@"e7");
	return dict;
}

@end

