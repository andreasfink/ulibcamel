//
//  UMCamelUserProtocol.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibcamel/UMCamelUserIdentifier.h>

#import <ulibcamel/UMCamel_ApplyChargingArg.h>
#import <ulibcamel/UMCamel_ApplyChargingReportArg.h>
#import <ulibcamel/UMCamel_AssistRequestInstructionsArg.h>
#import <ulibcamel/UMCamel_CallGapArg.h>
#import <ulibcamel/UMCamel_CallInformationRequestArg.h>
#import <ulibcamel/UMCamel_ConnectArg.h>
#import <ulibcamel/UMCamel_ConnectToResourceArg.h>
#import <ulibcamel/UMCamel_ContinueWithArgumentArg.h>
#import <ulibcamel/UMCamel_EstablishTemporaryConnectionArg.h>
//#import <ulibcamel/UMCamel_EventReportBCSMArg.h>
//#import <ulibcamel/UMCamel_FurnishChargingInformationArg.h>
//#import <ulibcamel/UMCamel_ReleaseCallArg.h>
//#import <ulibcamel/UMCamel_RequestReportBCSMEventArg.h>
//#import <ulibcamel/UMCamel_ResetTimerArg.h>
//#import <ulibcamel/UMCamel_SendChargingInformationArg.h>
//#import <ulibcamel/UMCamel_PlayAnnouncementArg.h>
//#import <ulibcamel/UMCamel_PromptAndCollectUserInformationArg.h>
//#import <ulibcamel/UMCamel_SpecializedResourceReportArg.h>
//#import <ulibcamel/UMCamel_ConnectSMSArg.h>
//#import <ulibcamel/UMCamel_EventReportSMSArg.h>
//#import <ulibcamel/UMCamel_FurnishChargingInformationSMSArg.h>
//#import <ulibcamel/UMCamel_InitialDPSMSArg.h>
//#import <ulibcamel/UMCamel_ReleaseSMSArg.h>
//#import <ulibcamel/UMCamel_RequestReportSMSEventArg.h>
//#import <ulibcamel/UMCamel_ResetTimerSMSArg.h>
//#import <ulibcamel/UMCamel_ApplyChargingGPRSArg.h>
//#import <ulibcamel/UMCamel_ApplyChargingReportGPRSArg.h>
//#import <ulibcamel/UMCamel_CancelGPRSArg.h>
//#import <ulibcamel/UMCamel_ConnectGPRSArg.h>
//#import <ulibcamel/UMCamel_ContinueGPRSArg.h>
//#import <ulibcamel/UMCamel_EntityReleasedGPRSArg.h>
//#import <ulibcamel/UMCamel_EventReportGPRSArg.h>
//#import <ulibcamel/UMCamel_FurnishChargingInformationGPRSArg.h>
//#import <ulibcamel/UMCamel_InitialDPGPRSArg.h>
//#import <ulibcamel/UMCamel_ReleaseGPRSArg.h>
//#import <ulibcamel/UMCamel_RequestReportGPRSEventArg.h>
//#import <ulibcamel/UMCamel_ResetTimerGPRSArg.h>

@class UMCamel_ApplyChargingArg;
@class UMCamel_ApplyChargingReportArg;
@class UMCamel_AssistRequestInstructionsArg;
@class UMCamel_CallGapArg;
@class UMCamel_CallInformationRequestArg;
@class UMCamel_CancelArg;
@class UMCamel_ConnectArg;
@class UMCamel_ConnectToResourceArg;
@class UMCamel_ContinueWithArgumentArg;
@class UMCamel_EstablishTemporaryConnectionArg;
@class UMCamel_EventReportBCSMArg;
@class UMCamel_FurnishChargingInformationArg;
@class UMCamel_ReleaseCallArg;
@class UMCamel_RequestReportBCSMEventArg;
@class UMCamel_ResetTimerArg;
@class UMCamel_SendChargingInformationArg;
@class UMCamel_PlayAnnouncementArg;
@class UMCamel_PromptAndCollectUserInformationArg;
@class UMCamel_SpecializedResourceReportArg;
@class UMCamel_ConnectSMSArg;
@class UMCamel_EventReportSMSArg;
@class UMCamel_FurnishChargingInformationSMSArg;
@class UMCamel_InitialDPSMSArg;
@class UMCamel_ReleaseSMSArg;
@class UMCamel_RequestReportSMSEventArg;
@class UMCamel_ResetTimerSMSArg;
@class UMCamel_ApplyChargingGPRSArg;
@class UMCamel_ApplyChargingReportGPRSArg;
@class UMCamel_CancelGPRSArg;
@class UMCamel_ConnectGPRSArg;
@class UMCamel_ContinueGPRSArg;
@class UMCamel_EntityReleasedGPRSArg;
@class UMCamel_EventReportGPRSArg;
@class UMCamel_FurnishChargingInformationGPRSArg;
@class UMCamel_InitialDPGPRSArg;
@class UMCamel_ReleaseGPRSArg;
@class UMCamel_RequestReportGPRSEventArg;
@class UMCamel_ResetTimerGPRSArg;

@protocol UMCamelUserProtocol <NSObject>

- (UMCamelUserIdentifier *)getNewCamelUserIdentifier;

-(void)camel:(UMCamelUserIdentifier *)cuid activityTest:(UMASN1Object *)unused;
-(void)camel:(UMCamelUserIdentifier *)cuid applyCharging:(UMCamel_ApplyChargingArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid applyChargingReport:(UMCamel_ApplyChargingReportArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid assistRequestInstructions:(UMCamel_AssistRequestInstructionsArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid callGap:(UMCamel_CallGapArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid callInformationReport:(UMCamel_CallInformationRequestArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid cancel:(UMCamel_CancelArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid connect:(UMCamel_ConnectArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid connectToResource:(UMCamel_ConnectToResourceArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid continue:(UMASN1Object *)unused;
-(void)camel:(UMCamelUserIdentifier *)cuid continueWithArgument:(UMCamel_ContinueWithArgumentArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid disconnectForwardConnection:(UMASN1Object *)unused;
-(void)camel:(UMCamelUserIdentifier *)cuid establishTemporaryConnection:(UMCamel_EstablishTemporaryConnectionArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid eventReportBCSM:(UMCamel_EventReportBCSMArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid furnishChargingInformation:(UMCamel_FurnishChargingInformationArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid releaseCall:(UMCamel_ReleaseCallArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid requestReportBCSMEvent:(UMCamel_RequestReportBCSMEventArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid resetTimer:(UMCamel_ResetTimerArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid sendChargingInformation:(UMCamel_SendChargingInformationArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid playAnnouncement:(UMCamel_PlayAnnouncementArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid promptAndCollectUserInformation:(UMCamel_PromptAndCollectUserInformationArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid activityTestGPRS:(UMASN1Object *)unused;
-(void)camel:(UMCamelUserIdentifier *)cuid specializedResourceReport:(UMCamel_SpecializedResourceReportArg *)arg;

-(void)camel:(UMCamelUserIdentifier *)cuid connectSMS:(UMCamel_ConnectSMSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid continueSMS:(UMASN1Object *)unused;
-(void)camel:(UMCamelUserIdentifier *)cuid eventReportSMS:(UMCamel_EventReportSMSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid furnishChargingInformationSMS:(UMCamel_FurnishChargingInformationSMSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid initialDPSMS:(UMCamel_InitialDPSMSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid releaseSMS:(UMCamel_ReleaseSMSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid requestReportSMSEvent:(UMCamel_RequestReportSMSEventArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid resetTimerSMS:(UMCamel_ResetTimerSMSArg *)arg;

-(void)camel:(UMCamelUserIdentifier *)cuid applyChargingGPRS:(UMCamel_ApplyChargingGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid applyChargingReportGPRS:(UMCamel_ApplyChargingReportGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid callInformationRequest:(UMASN1Object *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid cancelGPRS:(UMCamel_CancelGPRSArg *)arg;

-(void)camel:(UMCamelUserIdentifier *)cuid collectInformation:(UMASN1Object *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid connectGPRS:(UMCamel_ConnectGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid continueGPRS:(UMCamel_ContinueGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid entityReleased:(UMCamel_EntityReleasedGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid eventReportGPRS:(UMCamel_EventReportGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid furnishChargingInformationGPRS:(UMCamel_FurnishChargingInformationGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid initialDPGPRS:(UMCamel_InitialDPGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid releaseGPRS:(UMCamel_ReleaseGPRSArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid requestReportGPRSEvent:(UMCamel_RequestReportGPRSEventArg *)arg;
-(void)camel:(UMCamelUserIdentifier *)cuid resetTimerGPRS:(UMCamel_ResetTimerGPRSArg *)arg;

@end

