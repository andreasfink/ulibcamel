//
//  UMCamel_AOCBeforeAnswer.m
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_AOCBeforeAnswer.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_AOCBeforeAnswer


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	CONTEXT_SPECIFIC_ADD(0,_al);
	CONTEXT_SPECIFIC_ADD(0,_aOCSubsequent);
}


- (UMCamel_AOCBeforeAnswer *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	
	GET_CONTEXT_SPECIFIC(0,_al,UMCamel_CAI_Gsm0224,o,p);
	GET_CONTEXT_SPECIFIC(0,_aOCSubsequent,UMCamel_AOCSubsequent,o,p);
	return self;
}

- (NSString *) objectName
{
	return @"AOCBeforeAnswer";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	DICT_ADD(dict,_al,@"al");
	DICT_ADD(dict,_aOCSubsequent,@"aOCSubsequent");
	return dict;
}

@end

