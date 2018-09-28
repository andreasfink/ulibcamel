//
//  AppDelegate.h
//  ulibcamel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//


#import <ulibcamel/ulibcamel.h>

#ifdef __APPLE__
    /* this is for unit tests to work in Xcode */
#import <cocoa/cocoa.h>
    @interface AppDelegate : NSObject<NSApplicationDelegate>
#else
    @interface AppDelegate : NSObject
#endif
{
    UMCommandLine *_commandLine;
    NSArray *_inputData;
    NSArray *_inputFilenames;
    NSString *_outputFile;
    UMCamelOperationCode   _operationCode;
    
}

@property(readwrite,assign)     UMLogLevel logLevel;

- (void)processCommandLine:(int)argc argv:(const char **)argv;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
- (void)applicationWillTerminate:(NSNotification *)aNotification;

- (void)signal_SIGPIPE;
- (void)signal_SIGHUP;
- (void)signal_SIGUSR1;
- (void)signal_SIGUSR2;

@end

