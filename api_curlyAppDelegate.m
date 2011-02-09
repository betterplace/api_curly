//
//  api_curlyAppDelegate.m
//  api_curly
//
//  Created by Daniel Hahn on 02.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "api_curlyAppDelegate.h"

@implementation api_curlyAppDelegate

@synthesize window, urlField, tokenField, requestField, resultView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[self loadUserDefaults];
}

- (void) updateUserDefaults {
	[[NSUserDefaults standardUserDefaults] setObject:[urlField stringValue] forKey:@"requestUrl"];
	[[NSUserDefaults standardUserDefaults] setObject:[tokenField stringValue] forKey:@"requestToken"];
	[[NSUserDefaults standardUserDefaults] setObject:[requestField stringValue] forKey:@"requestXml"];
}

- (void) loadUserDefaults {
	[urlField setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestUrl"]];
	[tokenField setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestToken"]];
	[requestField setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestXml"]];
}

- (void)sendRequest:(id)sender {
	[self updateUserDefaults];
	NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/bin/curl"];
	
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects:@"-v",
				 @"-u", [tokenField stringValue],
				 @"--data", [requestField stringValue], 
				 @"-H", @"Content-Type: text/xml", 
				 @"-H", @"Accept: application/vnd.de.payback.v1+xml",
				 [urlField stringValue], nil
				];
    [task setArguments: arguments];
	
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
	
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
	
    [task launch];
	
    NSData *data;
    data = [file readDataToEndOfFile];
	
    NSString *string;
    string = [[NSString alloc] initWithData: data
								   encoding: NSUTF8StringEncoding];
	[resultView insertText: string];
	
}

- (void)clearResult:(id)sender
{
	[resultView setString:@""];
}

@end