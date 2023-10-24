//
//  UMCamel_AOCSubsequent.m
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_AOCSubsequent.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_AOCSubsequent

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	CONTEXT_SPECIFIC_ADD(0,_cAI_GSM0224);
	CONTEXT_SPECIFIC_ADD(1,_tariffSwitchInterval);
}


- (UMCamel_AOCSubsequent *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	
	GET_CONTEXT_SPECIFIC(0,_cAI_GSM0224,UMCamel_CAI_Gsm0224,o,p);
	GET_CONTEXT_SPECIFIC(0,_tariffSwitchInterval,UMASN1Integer,o,p);
	return self;
}

- (NSString *) objectName
{
	return @"AOCGprs";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	DICT_ADD(dict,_cAI_GSM0224,@"cAI-GSM0224");
	DICT_ADD(dict,_tariffSwitchInterval,@"tariffSwitchInterval");
	return dict;
}

@end

