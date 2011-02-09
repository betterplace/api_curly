//
//  api_curlyAppDelegate.m
//  api_curly
//
//  Created by Daniel Hahn on 02.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "api_curlyAppDelegate.h"

@implementation api_curlyAppDelegate

@synthesize window, urlField, requestField, conDelegate;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[self loadUserDefaults];
}

- (void) updateUserDefaults {
	[[NSUserDefaults standardUserDefaults] setObject:[urlField stringValue] forKey:@"requestUrl"];
	[[NSUserDefaults standardUserDefaults] setObject:[requestField stringValue] forKey:@"requestXml"];
	[conDelegate updateUserDefaults];
}

- (void) loadUserDefaults {
	[urlField setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestUrl"]];
	[requestField setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestXml"]];
	[conDelegate loadUserDefaults];
}

- (void)sendRequest:(id)sender {
	[self updateUserDefaults];
	[conDelegate clearResult:self];
	
	// Create the request.
	NSMutableURLRequest *apiRequest = [[[NSMutableURLRequest alloc] init] autorelease];
	NSURL *url = [NSURL URLWithString:[urlField stringValue]];
	[apiRequest setURL:url];
	[apiRequest setHTTPMethod:@"POST"];
	// [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	// [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	// [request setHTTPBody:postData];
	[apiRequest setTimeoutInterval:10.0];
	[apiRequest setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
	
	// create the connection with the request
	// and start loading the data
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:apiRequest delegate:conDelegate];
	
	// [resultView insertText: string];
}

@end