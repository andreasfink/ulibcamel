//
//  UMCamel_ETSINumber.h
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

typedef enum ETSI_NaiType
{
    ETSI_NAI_SPARE                  = 0,
    ETSI_NAI_SUBSCRIBER             = 1,
    ETSI_NAI_UNKNOWN                = 2,
    ETSI_NAI_NATIONAL               = 3,
    ETSI_NAI_INTERNATIONAL          = 4,
    ETSI_NAI_NETWORK_SPECIFIC       = 5,
    ETSI_NAI_ROUTING_NATIONAL       = 6,
    ETSI_NAI_ROUTING_CONCATENATED   = 7,
} ETSI_NaiType;

typedef enum ETSI_NpiType
{
    ETSI_NPI_SPARE0             = 0,
    ETSI_NPI_ISDN_E164          = 1,
    ETSI_NPI_SPARE2             = 2,
    ETSI_NPI_DATA_X121          = 3,
    ETSI_NPI_TELEX_F69          = 4,
    ETSI_NPI_NATIONAL_RESERVED5 = 5,
    ETSI_NPI_NATIONAL_RESERVED6 = 6,
    ETSI_NPI_SPARE7             = 7,
} ETSI_NpiType;

@interface UMCamel_EtsiNumber : UMASN1OctetString
{
    ETSI_NaiType        _nai;
    ETSI_NpiType        _npi;
    BOOL                _odd;
    BOOL                _innIndicator;
    NSString *  _address;
}

@property(readwrite,assign,atomic)  ETSI_NaiType nai;
@property(readwrite,assign,atomic)  ETSI_NpiType npi;
@property(readwrite,strong,atomic)  NSString *address;
@property(readwrite,assign,atomic)  BOOL odd;
@property(readwrite,assign,atomic)  BOOL innIndicator;


- (UMCamel_EtsiNumber *)initWithString:(NSString *)msisdn;
- (UMCamel_EtsiNumber *)initWithAddress:(NSString *)msisdn
                                    nai:(ETSI_NaiType)xnai
                                    npi:(ETSI_NpiType)xnpi;

- (NSString *)stringValue;
+ (NSString *)decodeSwappedDigitsTerminatedWithF:(NSData *)d;

@end
