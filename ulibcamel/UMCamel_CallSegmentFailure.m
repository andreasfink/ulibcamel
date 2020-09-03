//
//  UMCamel_CallSegmentFailure.m
//  ulibcamel
//
//  Created by Andreas Fink on 30.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_CallSegmentFailure.h"
#import "UMCamel_ASN1_macros.h"

@implementation UMCamel_CallSegmentFailure



- (NSString *) objectName
{
    return @"CallSegmentFailure";
}


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    CONTEXT_SPECIFIC_ADD(0,_callSegmentID);
    CONTEXT_SPECIFIC_ADD(2,_cause);
}


- (UMCamel_CallSegmentFailure *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    GET_CONTEXT_SPECIFIC(0,_callSegmentID,UMCamel_CallSegmentID,o,p);
    GET_CONTEXT_SPECIFIC(2,_cause,UMCamel_Cause,o,p);
    return self;
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_callSegmentID,@"callSegmentID");
    DICT_ADD(dict,_cause,@"cause");
    return dict;
}

@end
