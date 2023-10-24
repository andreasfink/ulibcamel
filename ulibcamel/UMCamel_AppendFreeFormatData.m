//
//  UMCamel_AppendFreeFormatData.m
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibcamel/UMCamel_AppendFreeFormatData.h>

@implementation UMCamel_AppendFreeFormatData

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
	s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
	if(([s isEqualToString:@"overwrite"]) || ([s isEqualToString:@"overwrite (0)"]))
	{
		return [super initWithValue:UMCamel_AppendFreeFormatData_overwrite];
	}
	if(([s isEqualToString:@"append"]) || ([s isEqualToString:@"append (1)"]))
	{
		return [super initWithValue:UMCamel_AppendFreeFormatData_append];
	}
	return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"AppendFreeFormatData";
}

- (id) objectValue
{
	switch(self.value)
	{
		case UMCamel_AppendFreeFormatData_overwrite:
			return @"overwrite (0)";
			break;
		case UMCamel_AppendFreeFormatData_append:
			return @"append (1)";
			break;
		default:
			return [NSString stringWithFormat:@"undefined (%d)",(int)self.value];
	}
}

@end
