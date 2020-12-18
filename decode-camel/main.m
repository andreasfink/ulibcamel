//
//  main.m
//  decode-camel
//
//  Created by Andreas Fink on 28.09.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulib/ulib.h>

#import "AppDelegate.h"

/* Global Variables */
AppDelegate *g_app_delegate = NULL;
int          g_must_quit = 0;
static int  signal_sigint = 0;
static int  signal_sigpipe = 0;
static int  signal_sighup = 0;
static int  signal_sigusr1 = 0;
static int  signal_sigusr2 = 0;
#ifdef USE_STARTER
#define MAIN umain
#else
#define MAIN main
#endif

int MAIN(int argc, const char * argv[]);
static void check_signals(void);
static void signal_handler(int signum);
static void setup_signal_handlers(void);

int MAIN(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        AppDelegate *g_app_delegate = [[AppDelegate alloc]init];
        [g_app_delegate processCommandLine:argc argv:argv];
        setup_signal_handlers();
        
        [NSOperationQueue mainQueue]; /* this initializes some stuff for the main run loop on Linux/GNUStep */
        [g_app_delegate applicationDidFinishLaunching:NULL];
        
        while(g_must_quit==0)
        {
            @autoreleasepool
            {
                [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
                check_signals();
            }
        }
    }
    return 0;
}

void check_signals(void)
{
    if(signal_sigpipe>0)
    {
        signal_sigpipe--;
        [g_app_delegate signal_SIGPIPE];
    }
    if(signal_sighup>0)
    {
        signal_sighup--;
        [g_app_delegate signal_SIGHUP];
    }
    if(signal_sigint>0)
    {
        signal_sigint=0;
        if (g_must_quit == 0)
        {
            NSLog(@"SIGINT received, aborting program...");
            g_must_quit = 1;
            [g_app_delegate applicationWillTerminate:NULL];
        }
        else
        {
            NSLog(@"SIGINT received again, force quitting program...");
            g_must_quit = 2;
            exit(-1);
        }
    }
    if(signal_sigusr1>0)
    {
        signal_sigusr1--;
        [g_app_delegate signal_SIGUSR1];
    }
    if(signal_sigusr2>0)
    {
        signal_sigusr2--;
        [g_app_delegate signal_SIGUSR2];
    }
}


static void signal_handler(int signum)
{
    /*
     this can be called in any state. so its not safe to call anything
     else. We thus only increase a variable and do the work in
     check_signals() which is called regularly (every second) from the main thread
     */
    if (signum == SIGINT)
    {
        signal_sigint++;
    }
    else if (signum == SIGPIPE)
    {
        signal_sigpipe++;
    }
    else if (signum == SIGHUP)
    {
        signal_sighup++;
    }
    else if (signum == SIGUSR1)
    {
        signal_sigusr1++;
    }
    else if (signum == SIGUSR2)
    {
        signal_sigusr2++;
    }
<<<<<<< HEAD
#if defined SIGINFO
    else if (signum == SIGINFO)
    {
        signal_siginfo++;
    }
#endif
=======
>>>>>>> cf7fe07c287fdc2338f088588e98fcc6525abfc5
}


static void setup_signal_handlers(void)
{
    struct sigaction act;
    act.sa_handler = signal_handler;
    sigemptyset(&act.sa_mask);
    act.sa_flags = 0;
    sigaction(SIGINT, &act, NULL);
    sigaction(SIGHUP, &act, NULL);
    sigaction(SIGPIPE, &act, NULL);
    sigaction(SIGUSR1, &act, NULL);
    sigaction(SIGUSR2, &act, NULL);
}


