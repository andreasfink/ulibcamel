//
//  AppDelegate.m
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "AppDelegate.h"
#import <ulibtcap/ulibtcap.h>
#import <ulibcamel/ulibcamel.h>
#import "version.h"

#define CONFIG_ERROR(s)     [NSException exceptionWithName:[NSString stringWithFormat:@"CONFIG_ERROR FILE %s line:%ld",__FILE__,(long)__LINE__] reason:s userInfo:@{@"backtrace": UMBacktrace(NULL,0) }]

@implementation AppDelegate

- (void)processCommandLine:(int)argc argv:(const char **)argv
{
    NSDictionary *appDefinition = @ {
        @"version" : @(VERSION),
        @"executable" : @"decode-camel",
        @"run-as" : @(argv[0]),
        @"copyright" : @"© 2018 Andreas Fink",
    };
    
    NSArray *commandLineDefinition = @[
                                       @{
                                           @"name"  : @"version",
                                           @"short" : @"-V",
                                           @"long"  : @"--version",
                                           @"help"  : @"shows the software version"
                                           },
                                       @{
                                           @"name"  : @"verbose",
                                           @"short" : @"-v",
                                           @"long"  : @"--verbose",
                                           @"help"  : @"enables verbose mode"
                                           },
                                       @{
                                           @"name"  : @"help",
                                           @"short" : @"-h",
                                           @"long" : @"--help",
                                           @"help"  : @"shows the help screen",
                                           },
                                       @{
                                           @"name"  : @"binary",
                                           @"short" : @"-b",
                                           @"long"  : @"--binary",
                                           @"multi" : @(YES),
                                           @"argument" : @"filename",
                                           @"help"  : @"reads the indicated input file in binary",
                                           },
                                       @{
                                           @"name"  : @"input",
                                           @"short" : @"-i",
                                           @"long"  : @"--input",
                                           @"multi" : @(YES),
                                           @"argument" : @"filename",
                                           @"help"  : @"reads the indicated input file with hex strings in it",
                                           },
                                       @{
                                           @"name"  : @"operation-code",
                                           @"short" : @"-c",
                                           @"long"  : @"--operation-code",
                                           @"multi" : @(NO),
                                           @"argument" : @"operation-code",
                                           @"help"  : @"the tcap operation code",
                                           },
@{
                                           @"name"  : @"output",
                                           @"short" : @"-o",
                                           @"long"  : @"--output",
                                           @"multi" : @(YES),
                                           @"argument" : @"filename",
                                           @"help"  : @"writes the output to the file (defaults to stdout)",
                                           },
                                       ];
    
    _commandLine = [[UMCommandLine alloc]initWithCommandLineDefintion:commandLineDefinition
                                                        appDefinition:appDefinition
                                                                 argc:argc
                                                                 argv:argv];
    [_commandLine handleStandardArguments];

    NSDictionary *params = _commandLine.params;
    NSMutableArray *inputData = [[NSMutableArray alloc]init];
    NSMutableArray *inputFilename = [[NSMutableArray alloc]init];
    if(params[@"input"])
    {
        for(NSString *filename in  params[@"input"])
        {
            NSError *err=NULL;
            NSString *s = [NSString stringWithContentsOfFile:filename  encoding:NSUTF8StringEncoding error:&err];
            if(err)
            {
                NSLog(@"Error %@",err);
                exit(-1);
            }
            NSArray *a = [s componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
            for(NSString *line in a)
            {
                NSData *d = [line unhexedData];
                if(d.length)
                {
                    [inputData addObject:d];
                    [inputFilename addObject:filename];
                }
            }
        }
    }
    if(params[@"binary-input"])
    {
        for(NSString *filename in  params[@"binary-input"])
        {
            NSData *d = [NSData dataWithContentsOfFile:filename];
            if(d.length)
            {
                [inputData addObject:d];
                [inputFilename addObject:filename];
            }
        }
    }
    if(params[@"operation-code"])
    {
        for(NSString *op in  params[@"operation-code"])
        {
            _operationCode = (UMCamelOperationCode)atoi(op.UTF8String);
        }
    }
    _inputData = inputData;
    _inputFilenames = inputFilename;
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    FILE *f = stdout;
    if(_outputFile.length > 0)
    {
        f = fopen(_outputFile.UTF8String,"+wb");
        if(f==NULL)
        {
            fprintf(stderr,"Can not open %s for writing",_outputFile.UTF8String);
            exit(-1);
        }
    }
    NSString *currentFile =NULL;
    NSUInteger n = [_inputData count];
    NSMutableArray *out = [[NSMutableArray alloc]init];
    for(NSUInteger i=0;i<n;i++)
    {
        NSData *d = _inputData[i];
        NSString *s = _inputFilenames[i];
        if(![currentFile isEqualToString:s])
        {
            fprintf(f,"----------------------------------------\n");
            fprintf(f,"File: %s\n",s.UTF8String);
            fprintf(f,"----------------------------------------\n");
        }
        currentFile = s;
        UMASN1Object *asn1 = [[UMASN1Object alloc]initWithBerData:d];
        
        asn1 = [UMLayerCamel decodeAsn1:asn1];
        UMSynchronizedSortedDictionary *o = (UMSynchronizedSortedDictionary *)[asn1 objectValue];
        [out addObject:o];
    }
    NSString *json = [out jsonString];
    fprintf(f,"%s\n",json.UTF8String);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}


- (void)signal_SIGPIPE
{
    
}
- (void)signal_SIGHUP
{
    exit(-1);
}

- (void)signal_SIGUSR1
{
    
}

- (void)signal_SIGUSR2
{
    
}

@end
