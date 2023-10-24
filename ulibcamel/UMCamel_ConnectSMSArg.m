//
//  UMCamel_ConnectSMSArg.m
//  ulibcamel
//
//  Created by Andreas Fink on 18.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

/*

 SEQUENCE
 {
 callingPartysNumber         [0] SMS-AddressString   OPTIONAL,
 destinationSubscriberNumber [1] CalledPartyBCDNumber OPTIONAL,
 sMSCAddress                 [2] ISDN-AddressString   OPTIONAL,
 extensions                  [10] ExtensionsArray     OPTIONAL,
 ...
 }
*/
#import <ulibcamel/UMCamel_ConnectSMSArg.h>

@implementation UMCamel_ConnectSMSArg



- (void) processBeforeEncode
{
    [super processBeforeEncode];
    _asn1_tag.isConstructed=YES;
    _asn1_list = [[NSMutableArray alloc]init];
    if(_callingPartysNumber)
    {
        _callingPartysNumber.asn1_tag.tagNumber = 0;
        _callingPartysNumber.asn1_tag.tagClass =UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_callingPartysNumber];
    }
    if(_destinationSubscriberNumber)
    {
        _destinationSubscriberNumber.asn1_tag.tagNumber = 1;
        _destinationSubscriberNumber.asn1_tag.tagClass =UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_destinationSubscriberNumber];
    }
    if(_sMSCAddress)
    {
        _sMSCAddress.asn1_tag.tagNumber = 2;
        _sMSCAddress.asn1_tag.tagClass =UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_sMSCAddress];
    }
}


- (UMCamel_ConnectSMSArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if((o) && (o.asn1_tag.tagNumber==0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _callingPartysNumber = [[UMCamel_SMS_AddressString alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber==1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _destinationSubscriberNumber = [[UMCamel_CalledPartyBCDNumber alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber==2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _sMSCAddress = [[UMCamel_ISDN_AddressString alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"ConnectSMSArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_callingPartysNumber)
    {
        dict[@"callingPartysNumber"] = _callingPartysNumber.objectValue;
    }
    if(_destinationSubscriberNumber)
    {
        dict[@"destinationSubscriberNumber"] = _destinationSubscriberNumber.objectValue;
    }
    if(_sMSCAddress)
    {
        dict[@"sMSCAddress"] = _sMSCAddress.objectValue;
    }
    return dict;
}



@end
