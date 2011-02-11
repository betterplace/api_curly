//
//  connection_delegate.m
//  api_curly
//
//  Created by Daniel Hahn on 09.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ConnectionDelegate.h"


@implementation ConnectionDelegate

@synthesize resultView, tokenField, userIdField, startButton;

- (void)clearResult:(id)sender
{
	[resultView setString:@""];
}

- (void) updateUserDefaults {
	[[NSUserDefaults standardUserDefaults] setObject:[tokenField stringValue] forKey:@"requestToken"];
	[[NSUserDefaults standardUserDefaults] setObject:[userIdField stringValue] forKey:@"requestUserId"];
}

- (void) loadUserDefaults {
	[tokenField setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestToken"]];
	[userIdField setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"requestUserId"]];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSString* message = @"";
	if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
		message = [NSString stringWithFormat: @"Received response %d\n", [(NSHTTPURLResponse *) response statusCode]];
		
	} else {
		message = [NSString stringWithFormat: @"Received non-http response for %@\n", [response MIMEType]];
	}

	[resultView insertText:message];
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
	
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [resultView insertText:message];
	[message release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // release the connection, and the data object
    [connection release];

    // inform the user
    NSString* message = [NSString stringWithFormat: @"Connection failed! Error - %@ %@\n",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]];
	[resultView insertText:message];
	[startButton setEnabled:TRUE];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [resultView insertText:@"Request complete"];
	
    // release the connection, and the data object
    [connection release];
	[startButton setEnabled:TRUE];
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	if ([challenge.protectionSpace.authenticationMethod
		 isEqualToString:NSURLAuthenticationMethodServerTrust])
	{
		NSURLCredential *credential =
		[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
		[challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
	}
	else 
	{
		if ([challenge previousFailureCount] == 0) {
			NSURLCredential *newCredential;
			newCredential = [NSURLCredential credentialWithUser:[tokenField stringValue]
													   password:[userIdField stringValue]
													persistence:NSURLCredentialPersistenceNone];
			[[challenge sender] useCredential:newCredential
				   forAuthenticationChallenge:challenge];
		} else {
			[resultView insertText:@"Cancelling Authentication request... token may be wrong.\n"];
			[[challenge sender] continueWithoutCredentialForAuthenticationChallenge:challenge];
		}
	}
}

// to deal with self-signed certificates
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
	return ([protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust] || [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodDefault]);
}

@end
