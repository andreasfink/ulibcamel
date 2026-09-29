//
//  UMCamel_AppendFreeFormatData.h
//  ulibcamel
//
//  Created by Andreas Fink on 17.10.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/ulibgsmmap.h>

typedef enum UMCamel_AppendFreeFormatData_enum
{
	UMCamel_AppendFreeFormatData_overwrite = 0,
	UMCamel_AppendFreeFormatData_append = 1,
} UMCamel_AppendFreeFormatData_enum;

@interface UMCamel_AppendFreeFormatData : UMASN1Enumerated
{
	
}
@end


