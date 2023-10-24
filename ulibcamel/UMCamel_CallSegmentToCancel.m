//
//  UMCamel_CallSegmentToCancel.m
//  ulibcamel
//
//  Created by Andreas Fink on 30.08.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_CallSegmentToCancel.h>
#import <ulibcamel/UMCamel_ASN1_macros.h>

@implementation UMCamel_CallSegmentToCancel



- (NSString *) objectName
{
    return @"CallSegmentToCancel";
}

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    CONTEXT_SPECIFIC_ADD(0,_callInvokeID);
    CONTEXT_SPECIFIC_ADD(1,_callSegmentID);
}


- (UMCamel_CallSegmentToCancel *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    GET_CONTEXT_SPECIFIC(0,_callInvokeID,UMCamel_InvokeID,o,p);
    GET_CONTEXT_SPECIFIC(1,_callSegmentID,UMCamel_CallSegmentID,o,p);
    return self;
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    DICT_ADD(dict,_callInvokeID,@"callInvokeID");
    DICT_ADD(dict,_callSegmentID,@"callSegmentID");
    return dict;
}

@end
