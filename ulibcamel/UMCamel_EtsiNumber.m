//
//  UMCamel_EtsiNumber.m
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMCamel_EtsiNumber.h"
#define MAXADDRLEN  63



static int digit_to_nibble(int digit);

static inline int digit_to_nibble(int digit)
{
    switch(digit)
    {
        case '0':
            return 0;
        case '1':
            return 1;
        case '2':
            return 2;
        case '3':
            return 3;
        case '4':
            return 4;
        case '5':
            return 5;
        case '6':
            return 6;
        case '7':
            return 7;
        case '8':
            return 8;
        case '9':
            return 9;
        case '*':
            return 0x0B;
        case '#':
            return 0x0C;
    }
    return -1;
}


static inline unsigned char    nibble2digit(unsigned char b)
{
    if(b < 0x0A)
    {
        return '0'+ b;
    }
    if(b==0x0B)
    {
        return '*';
    }
    if(b==0x0C)
    {
        return '#';
    }
    return 'A'+ b - 0x0A;
}

@implementation UMCamel_EtsiNumber


- (NSString *)objectName
{
    return @"EtsiNumber";
}


- (UMCamel_EtsiNumber *)initWithString:(NSString *)digits
{
    self = [super init];
    if(self)
    {
        if(digits == nil)
        {
            _address = @"";
            _nai = 0;
            _npi = 0;
        }
        else if([digits length] < 2)
        {
            _address = @"";
            _nai = 0;
            _npi = 0;
        }
        else if ([digits compare:@"+" options:NSLiteralSearch range:NSMakeRange(0,1)] == NSOrderedSame )
        {
            _address = [digits substringFromIndex:1];
            _nai = ETSI_NAI_INTERNATIONAL;
            _npi = ETSI_NPI_ISDN_E164;
        }
        else if(([digits length] >= 2) && ( [digits compare:@"00" options:NSLiteralSearch  range:NSMakeRange(0,2)] == NSOrderedSame ))
        {
            _address = [digits substringFromIndex:2];
            _nai = ETSI_NAI_INTERNATIONAL;
            _npi = ETSI_NPI_ISDN_E164;
        }
        else if ( [digits compare:@"0" options:NSLiteralSearch range:NSMakeRange(0,1)] == NSOrderedSame )
        {
            _address = [digits substringFromIndex:1];
            _nai = ETSI_NAI_NATIONAL;
            _npi = ETSI_NPI_ISDN_E164;
        }

    }
    return self;
}

- (UMCamel_EtsiNumber *)initWithAddress:(NSString *)msisdn
                                    nai:(ETSI_NaiType)xnai
                                    npi:(ETSI_NpiType)xnpi
{
    self = [super init];
    if(self)
    {
        _nai = xnai;
        _npi = xnpi;
        _address = msisdn;
    }
    return self;
}


- (void)processBeforeEncode
{
    int odd=0;
    uint8_t buffer[32];
    int bindex = 2;
    NSUInteger n = [_address length];
    for(NSUInteger i=0;i<n;i++)
    {
        int c = [_address characterAtIndex:i];
        int nib = digit_to_nibble(c);
        if(nib<0)
        {
            continue;
        }
        if(odd)
        {
            buffer[bindex] = (buffer[bindex] & 0x0F) | ((0xF & nib) << 4);
            bindex++;
            odd=NO;
        }
        else
        {
            buffer[bindex] = nib  | 0xF0;
            odd=YES;
        }
        if(bindex >=sizeof(buffer))
        {
            break;
        }
    }
    buffer[0] = _nai & 0x7F;
    if(_odd)
    {
        buffer[0] = buffer[0] | 0x80;
    }
    buffer[1] = (_npi & 0x3) < 4;
    if(_innIndicator)
    {
        buffer[1] = buffer[1] | 0x80;
    }
    _asn1_data = [NSData dataWithBytes:buffer length:bindex];
}

- (UMCamel_EtsiNumber *)processAfterDecodeWithContext:(id)context
{
    unsigned char c;
    unsigned char a;
    unsigned char b;
    
    NSUInteger pos=0;
    NSUInteger len = _asn1_data.length;
    const uint8_t *str = _asn1_data.bytes;
    if(len < 2)
    {
        @throw([NSException exceptionWithName:@"DECODING_ERROR" reason:@"UMCamel_EtsiNumber has length <2" userInfo:NULL]);
    }
    
    _odd = (str[0] | 0x80) ? YES : NO;
    _innIndicator = (str[1] | 0x80) ? YES : NO;
    _nai = str[0] & 0x7F;
    _npi = (str[1] >> 4) & 0x3;
    NSMutableData *tmp = [[NSMutableData alloc]init];
    pos=2;
    while(pos < len)
    {
        c = str[pos++];
        a =  c & 0x0F;
        b =  ((c & 0xF0) >> 4);
        
        if(a==0x0F)
        {
            break;
        }
        else if(b == 0x0F)
        {
            [tmp appendByte:nibble2digit(a)];
        }
        else
        {
            [tmp appendByte:nibble2digit(a)];
            [tmp appendByte:nibble2digit(b)];
        }
    }
    _address = [[NSString alloc]initWithData:tmp encoding:NSUTF8StringEncoding];
    return self;
}

- (id)objectValue
{
    UMSynchronizedSortedDictionary *a = [[UMSynchronizedSortedDictionary alloc]init];
    a[@"nai"] = @(_nai);
    a[@"npi"] = @(_npi);
    a[@"odd"] = @(_odd);
    a[@"inn-indicator"] = @(_innIndicator);
    if(_address)
    {
        a[@"address"] = _address;
    }
    return a;
}

- (NSString *)stringValue
{
    if((_nai == ETSI_NAI_INTERNATIONAL) && (_npi==ETSI_NPI_ISDN_E164))
    {
        return [NSString stringWithFormat:@"+%@",_address];
    }
    return _address;
}

+(NSString *)decodeSwappedDigitsTerminatedWithF:(NSData *)d
{
    const uint8_t *str = d.bytes;
    NSUInteger len = d.length;
    NSUInteger pos=0;
    NSMutableData *tmp = [[NSMutableData alloc]init];
    pos=2;
    while(pos < len)
    {
        int c = str[pos++];
        int a =  c & 0x0F;
        int b =  ((c & 0xF0) >> 4);
        
        if(a==0x0F)
        {
            break;
        }
        else if(b == 0x0F)
        {
            [tmp appendByte:nibble2digit(a)];
        }
        else
        {
            [tmp appendByte:nibble2digit(a)];
            [tmp appendByte:nibble2digit(b)];
        }
    }
    return [[NSString alloc]initWithData:tmp encoding:NSUTF8StringEncoding];
}
@end
