//
//  UMCamel_ErrorCode.h
//  ulibcamel
//
//  Created by Andreas Fink on 27.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

typedef enum UMCamelErrorCode
{
    UMCamelErrorCode_canceled = 0,
    UMCamelErrorCode_cancelFailed = 1,
    UMCamelErrorCode_eTCFailed = 3,
    UMCamelErrorCode_improperCallerResponse = 4,
    UMCamelErrorCode_missingCustomerRecord = 6,
    UMCamelErrorCode_missingParameter = 7,
    UMCamelErrorCode_parameterOutOfRange = 8,
    UMCamelErrorCode_requestedInfoError = 10,
    UMCamelErrorCode_systemFailure = 11,
    UMCamelErrorCode_taskRefused = 12,
    UMCamelErrorCode_unavailableResource = 13,
    UMCamelErrorCode_unexpectedComponentSequence = 14,
    UMCamelErrorCode_unexpectedDataValue = 15,
    UMCamelErrorCode_unexpectedParameter = 16,
    UMCamelErrorCode_unknownLegID = 17,
    UMCamelErrorCode_unknownPDPID = 50,
    UMCamelErrorCode_unknownCSID = 51,
} UMCamelErrorCode;
