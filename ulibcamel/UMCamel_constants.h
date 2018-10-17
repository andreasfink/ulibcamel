#if 0
-- #############################
-- Definition of range constants
-- #############################

leg1 LegType ::= '01'H
leg2 LegType ::= '02'H

numOfInfoItems INTEGER ::= 4

opcode-initialDP                       Code ::= 0
opcode-assistRequestInstructions       Code ::= 16
opcode-establishTemporaryConnection    Code ::= 17
opcode-disconnectForwardConnection     Code ::= 18
opcode-dFCWithArgument                 Code ::= 86
opcode-connectToResource               Code ::= 19
opcode-connect                         Code ::= 20
opcode-releaseCall                     Code ::= 22
opcode-requestReportBCSMEvent          Code ::= 23
opcode-eventReportBCSM                 Code ::= 24
opcode-collectInformation              Code ::= 27
opcode-continue                        Code ::= 31
opcode-initiateCallAttempt             Code ::= 32
-- opcode-continueWithArgument            Code ::= 56 (should be 88)
opcode-resetTimer                      Code ::= 33
opcode-furnishChargingInformation      Code ::= 34
opcode-applyCharging                   Code ::= 35
opcode-applyChargingReport             Code ::= 36
opcode-callGap                         Code ::= 41
opcode-callInformationReport           Code ::= 44
opcode-callInformationRequest          Code ::= 45
opcode-sendChargingInformation         Code ::= 46
opcode-playAnnouncement                Code ::= 47
opcode-promptAndCollectUserInformation Code ::= 48
opcode-specializedResourceReport       Code ::= 49
opcode-cancel                          Code ::= 53
opcode-activityTest                    Code ::= 55
opcode-initialDPSMS                    Code ::= 60
opcode-furnishChargingInformationSMS   Code ::= 61
opcode-connectSMS                      Code ::= 62
opcode-requestReportSMSEvent           Code ::= 63
opcode-eventReportSMS                  Code ::= 64
opcode-continueSMS                     Code ::= 65
opcode-releaseSMS                      Code ::= 66
opcode-resetTimerSMS                   Code ::= 67
opcode-activityTestGPRS                Code ::= 70
opcode-applyChargingGPRS               Code ::= 71
opcode-applyChargingReportGPRS         Code ::= 72
opcode-cancelGPRS                      Code ::= 73
opcode-connectGPRS                     Code ::= 74
opcode-continueGPRS                    Code ::= 75
opcode-entityReleasedGPRS              Code ::= 76
opcode-furnishChargingInformationGPRS  Code ::= 77
opcode-initialDPGPRS                   Code ::= 78
opcode-releaseGPRS                     Code ::= 79
opcode-eventReportGPRS                 Code ::= 80
opcode-requestReportGPRSEvent          Code ::= 81
opcode-resetTimerGPRS                  Code ::= 82
opcode-sendChargingInformationGPRS     Code ::= 83
opcode-continueWithArgument            Code ::= 88
opcode-disconnectLeg                   Code ::= 90
opcode-moveLeg                         Code ::= 93
opcode-splitLeg                        Code ::= 95
opcode-entityReleased                  Code ::= 96
opcode-playTone                        Code ::= 97

errcode-canceled                    Code ::= 0
errcode-cancelFailed                Code ::= 1
errcode-eTCFailed                   Code ::= 3
errcode-improperCallerResponse      Code ::= 4
errcode-missingCustomerRecord       Code ::= 6
errcode-missingParameter            Code ::= 7
errcode-parameterOutOfRange         Code ::= 8
errcode-requestedInfoError          Code ::= 10
errcode-systemFailure               Code ::= 11
errcode-taskRefused                 Code ::= 12
errcode-unavailableResource         Code ::= 13
errcode-unexpectedComponentSequence Code ::= 14
errcode-unexpectedDataValue         Code ::= 15
errcode-unexpectedParameter         Code ::= 16
errcode-unknownLegID                Code ::= 17
errcode-unknownPDPId                Code ::= 50
errcode-unknownCSId                 Code ::= 51

--cAPSpecificBoundSetnumOfExtensions                 INTEGER ::= 10
maxNumOfPrivateExtensions                          INTEGER ::= 10

--cAPSpecificBoundSetminCalledPartyBCDNumberLength   INTEGER ::= 1
--cAPSpecificBoundSetmaxCalledPartyBCDNumberLength   INTEGER ::= 41
maxISDN-AddressLength                              INTEGER ::= 9
-- for AddressString
maxAddressLength                                   INTEGER ::= 20

highLayerCompatibilityLength                       INTEGER ::= 2

cAPSpecificBoundSetminAccessPointNameLength        INTEGER ::= 1
cAPSpecificBoundSetmaxAccessPointNameLength        INTEGER ::= 100
cAPSpecificBoundSetminAChBillingChargingLength     INTEGER ::= 5
cAPSpecificBoundSetmaxAChBillingChargingLength     INTEGER ::= 177
cAPSpecificBoundSetminAttributesLength             INTEGER ::= 2
cAPSpecificBoundSetmaxAttributesLength             INTEGER ::= 10
cAPSpecificBoundSetmaxBearerCapabilityLength       INTEGER ::= 11
cAPSpecificBoundSetminCalledPartyBCDNumberLength   INTEGER ::= 1
cAPSpecificBoundSetmaxCalledPartyBCDNumberLength   INTEGER ::= 41
cAPSpecificBoundSetminCalledPartyNumberLength      INTEGER ::= 2
cAPSpecificBoundSetmaxCalledPartyNumberLength      INTEGER ::= 18
cAPSpecificBoundSetminCallingPartyNumberLength     INTEGER ::= 2
cAPSpecificBoundSetmaxCallingPartyNumberLength     INTEGER ::= 10
cAPSpecificBoundSetminCallResultLength             INTEGER ::= 12
cAPSpecificBoundSetmaxCallResultLength             INTEGER ::= 193
cAPSpecificBoundSetminCarrierLength                INTEGER ::= 4
cAPSpecificBoundSetmaxCarrierLength                INTEGER ::= 4
cAPSpecificBoundSetminCauseLength                  INTEGER ::= 2
cAPSpecificBoundSetmaxCauseLength                  INTEGER ::= 32
cAPSpecificBoundSetminDigitsLength                 INTEGER ::= 2
cAPSpecificBoundSetmaxDigitsLength                 INTEGER ::= 16
cAPSpecificBoundSetminFCIBillingChargingDataLength INTEGER ::= 1
cAPSpecificBoundSetmaxFCIBillingChargingDataLength INTEGER ::= 160
cAPSpecificBoundSetminFCIBillingChargingLength     INTEGER ::= 5
cAPSpecificBoundSetmaxFCIBillingChargingLength     INTEGER ::= 225
cAPSpecificBoundSetminGenericNumberLength          INTEGER ::= 3
cAPSpecificBoundSetmaxGenericNumberLength          INTEGER ::= 11
cAPSpecificBoundSetminGPRSCauseLength              INTEGER ::= 1
cAPSpecificBoundSetmaxGPRSCauseLength              INTEGER ::= 1
cAPSpecificBoundSetminIPSSPCapabilitiesLength      INTEGER ::= 1
cAPSpecificBoundSetmaxIPSSPCapabilitiesLength      INTEGER ::= 4
cAPSpecificBoundSetminLocationNumberLength         INTEGER ::= 2
cAPSpecificBoundSetmaxLocationNumberLength         INTEGER ::= 10
cAPSpecificBoundSetminLowLayerCompatibilityLength  INTEGER ::= 1
cAPSpecificBoundSetmaxLowLayerCompatibilityLength  INTEGER ::= 16
cAPSpecificBoundSetminMessageContentLength         INTEGER ::= 1
cAPSpecificBoundSetmaxMessageContentLength         INTEGER ::= 127
cAPSpecificBoundSetminOriginalCalledPartyIDLength  INTEGER ::= 2
cAPSpecificBoundSetmaxOriginalCalledPartyIDLength  INTEGER ::= 10
cAPSpecificBoundSetminPDPAddressLength             INTEGER ::= 1
cAPSpecificBoundSetmaxPDPAddressLength             INTEGER ::= 63
cAPSpecificBoundSetminRedirectingPartyIDLength     INTEGER ::= 2
cAPSpecificBoundSetmaxRedirectingPartyIDLength     INTEGER ::= 10
cAPSpecificBoundSetminScfIDLength                  INTEGER ::= 2
cAPSpecificBoundSetmaxScfIDLength                  INTEGER ::= 10
cAPSpecificBoundSetminSCIBillingChargingLength     INTEGER ::= 4
cAPSpecificBoundSetmaxSCIBillingChargingLength     INTEGER ::= 225
cAPSpecificBoundSetminTimeAndTimezoneLength        INTEGER ::= 8
cAPSpecificBoundSetmaxTimeAndTimezoneLength        INTEGER ::= 8
cAPSpecificBoundSetnumOfBCSMEvents                 INTEGER ::= 30
cAPSpecificBoundsSetnumOfChangeOfPositionControlInfo INTEGER ::= 10
cAPSpecificBoundsSetnumOfCSs                       INTEGER ::= 127
cAPSpecificBoundSetnumOfSMSEvents                  INTEGER ::= 10
cAPSpecificBoundSetnumOfGPRSEvents                 INTEGER ::= 10
cAPSpecificBoundSetnumOfExtensions                 INTEGER ::= 10
cAPSpecificBoundSetnumOfGenericNumbers             INTEGER ::= 5
cAPSpecificBoundSetnumOfMessageIDs                 INTEGER ::= 16


#endif

