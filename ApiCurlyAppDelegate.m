//
//  api_curlyAppDelegate.m
//  api_curly
//
//  Created by Daniel Hahn on 02.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ApiCurlyAppDelegate.h"

@implementation ApiCurlyAppDelegate

@synthesize window, urlField, requestView, conDelegate, apiVersionSelector;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[self loadUserDefaults];
}

- (void) updateUserDefaults {
	[[NSUserDefaults standardUserDefaults] setObject:[urlField stringValue] forKey:@"requestUrl"];
	[[NSUserDefaults standardUserDefaults] setObject:[requestView string] forKey:@"requestXml"];
	[conDelegate updateUserDefaults];
}

- (void) loadUserDefaults {
	[urlField setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestUrl"]];
	[requestView setString:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestXml"]];
	[conDelegate loadUserDefaults];
}

- (void)sendRequest:(id)sender {
	[self updateUserDefaults];
	[conDelegate clearResult:self];
	[[conDelegate startButton] setEnabled:FALSE];
	
	// Create the request.
	NSMutableURLRequest *apiRequest = [[[NSMutableURLRequest alloc] init] autorelease];
	NSURL *url = [NSURL URLWithString:[urlField stringValue]];
	NSData *postData = [[requestView string] dataUsingEncoding:NSUTF8StringEncoding];
	NSString *contentLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	[apiRequest setURL:url];
	[apiRequest setHTTPMethod:@"POST"];
	[apiRequest setValue:[self selectedApiVersion] forHTTPHeaderField:@"Accept"];
	[apiRequest setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
	[apiRequest setValue:contentLength forHTTPHeaderField:@"Content-Length"];
	[apiRequest setHTTPBody:postData];
	[apiRequest setTimeoutInterval:10.0];
	[apiRequest setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
	
	// create the connection with the request
	// and start loading the data
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:apiRequest delegate:conDelegate];
	if (!theConnection) {
		[[conDelegate resultView] insertText:@"Error: Could not create URL connection...\n"];
		[[conDelegate startButton] setEnabled:TRUE];
	}
}

- (NSString*) selectedApiVersion {
	NSString* versionString = @"";
	switch ([apiVersionSelector indexOfSelectedItem]) {
		case 0:
			versionString = @"application/vnd.de.payback.v1+xml";
			break;
		case 1:
			versionString = @"application/vnd.org.betterplace.v2+xml";
			break;
	}
	return versionString;
}

@end