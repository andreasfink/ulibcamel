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
#import "UMCamel_AssistRequestInstructionsArg.h"

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
            _opCodeName=@"InitialDP";
            _params = [[UMCamel_InitialDPArg alloc]initWithASN1Object:_params context:NULL];
            break;
        case UMCamelOperationCode_assistRequestInstructions:
            _opCodeName=@"AssistRequestInstructions";
            _params = [[UMCamel_AssistRequestInstructionsArg alloc]initWithASN1Object:_params context:NULL];
            break;
        case UMCamelOperationCode_establishTemporaryConnection:
            _params = [[UMCamel_AssistRequestInstructionsArg alloc]initWithASN1Object:_params context:NULL];

            _opCodeName=@"EstablishTemporaryConnection";
            break;
        case UMCamelOperationCode_disconnectForwardConnection:
            _opCodeName=@"DisconnectForwardConnection";

            break;
        case UMCamelOperationCode_connectToResource:
            _opCodeName=@"ConnectToResource";
            break;
        case UMCamelOperationCode_connect:
            _opCodeName=@"Connect";
            break;
        case UMCamelOperationCode_releaseCall:
            _opCodeName=@"ReleaseCall";
            break;
        case UMCamelOperationCode_requestReportBCSMEvent:
            _opCodeName=@"RequestReportBCSMEvent";
            break;
        case UMCamelOperationCode_eventReportBCSM:
            _opCodeName=@"EventReportBCSM";
            break;
        case UMCamelOperationCode_collectInformation:
            _opCodeName=@"CollectInformation";
            break;
        case UMCamelOperationCode_continue:
            _opCodeName=@"Continue";
            break;
        case UMCamelOperationCode_initiateCallAttempt:
            _opCodeName=@"InitiateCallAttempt";
            break;
        case UMCamelOperationCode_resetTimer:
            _opCodeName=@"ResetTimer";
            break;
        case UMCamelOperationCode_furnishChargingInformation:
            _opCodeName=@"FurnishChargingInformation";
            break;
        case UMCamelOperationCode_applyCharging:
            _opCodeName=@"ApplyCharging";
            break;
        case UMCamelOperationCode_applyChargingReport:
            _opCodeName=@"ApplyChargingReport";
            break;
        case UMCamelOperationCode_callGap:
            _opCodeName=@"CallGap";
            break;
        case UMCamelOperationCode_callInformationReport:
            _opCodeName=@"CallInformationReport";
            break;
        case UMCamelOperationCode_callInformationRequest:
            _opCodeName=@"CallInformationRequest";
            break;
        case UMCamelOperationCode_sendChargingInformation:
            _opCodeName=@"SendChargingInformation";
            break;
        case UMCamelOperationCode_playAnnouncement:
            _opCodeName=@"PlayAnnouncement";
            break;
        case UMCamelOperationCode_promptAndCollectUserInformation:
            _opCodeName=@"PromptAndCollectUserInformation";
            break;
        case UMCamelOperationCode_specializedResourceReport:
            _opCodeName=@"SpecializedResourceReport";
            break;
        case UMCamelOperationCode_cancel:
            _opCodeName=@"Cancel";
            break;
        case UMCamelOperationCode_activityTest:
            _opCodeName=@"ActivityTest";
            break;
        case UMCamelOperationCode_continueWithArgument1:
            _opCodeName=@"ContinueWithArgument1";
            break;
        case UMCamelOperationCode_initialDPSMS:
            _opCodeName=@"InitialDPSMS";
            break;
        case UMCamelOperationCode_furnishChargingInformationSMS:
            _opCodeName=@"FurnishChargingInformationSMS";
            break;
        case UMCamelOperationCode_connectSMS:
            _opCodeName=@"ConnectSMS";
            break;
        case UMCamelOperationCode_requestReportSMSEvent:
            _opCodeName=@"RequestReportSMSEvent";
            break;
        case UMCamelOperationCode_eventReportSMS:
            _opCodeName=@"EventReportSMS";
            break;
        case UMCamelOperationCode_continueSMS:
            _opCodeName=@"ContinueSMS";
            break;
        case UMCamelOperationCode_releaseSMS:
            _opCodeName=@"ReleaseSMS";
            break;
        case UMCamelOperationCode_resetTimerSMS:
            _opCodeName=@"ResetTimerSMS";
            break;
        case UMCamelOperationCode_activityTestGPRS:
            _opCodeName=@"ActivityTestGPRS";
            break;
        case UMCamelOperationCode_applyChargingGPRS:
            _opCodeName=@"ApplyChargingGPRS";
            break;
        case UMCamelOperationCode_applyChargingReportGPRS:
            _opCodeName=@"ApplyChargingReportGPRS";
            break;
        case UMCamelOperationCode_cancelGPRS:
            _opCodeName=@"CancelGPRS";
            break;
        case UMCamelOperationCode_connectGPRS:
            _opCodeName=@"ConnectGPRS";
            break;
        case UMCamelOperationCode_continueGPRS:
            _opCodeName=@"ContinueGPRS";
            break;
        case UMCamelOperationCode_entityReleasedGPRS:
            _opCodeName=@"EntityReleasedGPRS";
            break;
        case UMCamelOperationCode_furnishChargingInformationGPRS:
            _opCodeName=@"FurnishChargingInformationGPRS";
            break;
        case UMCamelOperationCode_initialDPGPRS:
            _opCodeName=@"InitialDPGPRS";
            break;
        case UMCamelOperationCode_releaseGPRS:
            _opCodeName=@"ReleaseGPRS";
            break;
        case UMCamelOperationCode_eventReportGPRS:
            _opCodeName=@"EventReportGPRS";
            break;
        case UMCamelOperationCode_requestReportGPRSEvent:
            _opCodeName=@"RequestReportGPRSEvent";
            break;
        case UMCamelOperationCode_resetTimerGPRS:
            _opCodeName=@"ResetTimerGPRS";
            break;
        case UMCamelOperationCode_sendChargingInformationGPRS:
            _opCodeName=@"SendChargingInformationGPRS";
            break;
        case UMCamelOperationCode_dFCWithArgument:
            _opCodeName=@"DFCWithArgument";
            break;
        case UMCamelOperationCode_continueWithArgument:
            _opCodeName=@"continueWithArgument";
            break;
        case UMCamelOperationCode_disconnectLeg:
            _opCodeName=@"DisconnectLeg";
            break;
        case UMCamelOperationCode_moveLeg:
            _opCodeName=@"MoveLeg";
            break;
        case UMCamelOperationCode_splitLeg:
            _opCodeName=@"SplitLeg";
            break;
        case UMCamelOperationCode_entityReleased:
            _opCodeName=@"EntityReleased";
            break;
        case UMCamelOperationCode_playTone:
            _opCodeName=@"PlayTone";
            break;
    }
    return self;
}

- (NSString *) objectName
{
    return @"Invoke";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];

    dict[@"invokeId"] = @(_invokeId);
    dict[@"opCode"] = @(_opCode);
    if(_opCodeName)
    {
        dict[@"opCodeDescription"] = _opCodeName;
    }
    DICT_ADD(dict,_params,@"params");
    return dict;
}

@end
