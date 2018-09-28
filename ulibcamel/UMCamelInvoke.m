//
//  UMCamelInvoke.m
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamelInvoke.h"
#import "UMCamel_ASN1_macros.h"
#import "UMCamelOperationCode.h"
#import "UMCamel_InitialDPArg.h"

@implementation UMCamelInvoke

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_tag.tagNumber = 1;
    _asn1_tag.tagClass = UMASN1Class_ContextSpecific;
    _asn1_list = [[NSMutableArray alloc]init];

    ASN1_ADD_INTEGER(_invokeId);
    ASN1_ADD_INTEGER(_opCode);
    ASN1_ADD_SEQUENCE(_params);
}

- (UMCamelInvoke *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];

    ASN1_GET_INTEGER(_invokeId,o,p);
    ASN1_GET_INTEGER(_opCode,o,p);
    ASN1_GET_SEQUENCE(_params,o,p);
    
    switch(_opCode)
    {
        case UMCamelOperationCode_initialDP:
            _params = [[UMCamel_InitialDPArg alloc]initWithASN1Object:_params context:NULL];
            break;
        case UMCamelOperationCode_assistRequestInstructions:
            break;
        case UMCamelOperationCode_establishTemporaryConnection:
            break;
        case UMCamelOperationCode_disconnectForwardConnection:
            break;
        case UMCamelOperationCode_connectToResource:
            break;
        case UMCamelOperationCode_connect:
            break;
        case UMCamelOperationCode_releaseCall:
            break;
        case UMCamelOperationCode_requestReportBCSMEvent:
            break;
        case UMCamelOperationCode_eventReportBCSM:
            break;
        case UMCamelOperationCode_collectInformation:
            break;
        case UMCamelOperationCode_continue:
            break;
        case UMCamelOperationCode_initiateCallAttempt:
            break;
        case UMCamelOperationCode_resetTimer:
            break;
        case UMCamelOperationCode_furnishChargingInformation:
            break;
        case UMCamelOperationCode_applyCharging:
            break;
        case UMCamelOperationCode_applyChargingReport:
            break;
        case UMCamelOperationCode_callGap:
            break;
        case UMCamelOperationCode_callInformationReport:
            break;
        case UMCamelOperationCode_callInformationRequest:
            break;
        case UMCamelOperationCode_sendChargingInformation:
            break;
        case UMCamelOperationCode_playAnnouncement:
            break;
        case UMCamelOperationCode_promptAndCollectUserInformation:
            break;
        case UMCamelOperationCode_specializedResourceReport:
            break;
        case UMCamelOperationCode_cancel:
            break;
        case UMCamelOperationCode_activityTest:
            break;
        case UMCamelOperationCode_continueWithArgument:
            break;
        case UMCamelOperationCode_initialDPSMS:
            break;
        case UMCamelOperationCode_furnishChargingInformationSMS:
            break;
        case UMCamelOperationCode_connectSMS:
            break;
        case UMCamelOperationCode_requestReportSMSEvent:
            break;
        case UMCamelOperationCode_eventReportSMS:
            break;
        case UMCamelOperationCode_continueSMS:
            break;
        case UMCamelOperationCode_releaseSMS:
            break;
        case UMCamelOperationCode_resetTimerSMS:
            break;
        case UMCamelOperationCode_activityTestGPRS:
            break;
        case UMCamelOperationCode_applyChargingGPRS:
            break;
        case UMCamelOperationCode_applyChargingReportGPRS:
            break;
        case UMCamelOperationCode_cancelGPRS:
            break;
        case UMCamelOperationCode_connectGPRS:
            break;
        case UMCamelOperationCode_continueGPRS:
            break;
        case UMCamelOperationCode_entityReleasedGPRS:
            break;
        case UMCamelOperationCode_furnishChargingInformationGPRS:
            break;
        case UMCamelOperationCode_initialDPGPRS:
            break;
        case UMCamelOperationCode_releaseGPRS:
            break;
        case UMCamelOperationCode_eventReportGPRS:
            break;
        case UMCamelOperationCode_requestReportGPRSEvent:
            break;
        case UMCamelOperationCode_resetTimerGPRS:
            break;
        case UMCamelOperationCode_sendChargingInformationGPRS:
            break;
        case UMCamelOperationCode_dFCWithArgument:
            break;
        case UMCamelOperationCode_continueWithArgument2:
            break;
        case UMCamelOperationCode_disconnectLeg:
            break;
        case UMCamelOperationCode_moveLeg:
            break;
        case UMCamelOperationCode_splitLeg:
            break;
        case UMCamelOperationCode_entityReleased:
            break;
        case UMCamelOperationCode_playTone:
            break;
    }
    return self;
}

- (NSString *) objectName
{
    return @"InitialDPArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];

    dict[@"invokeId"] = @(_invokeId);
    dict[@"opCode"] = @(_opCode);
    DICT_ADD(dict,_params,@"params");
    return dict;
}

@end
