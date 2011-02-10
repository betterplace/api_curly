//
//  connection_delegate.h
//  api_curly
//
//  Created by Daniel Hahn on 09.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ConnectionDelegate : NSObject {
	NSTextView *resultView;
	NSTextField *tokenField;
	NSTextField *userIdField;
	NSButton *startButton;
}

@property (assign) IBOutlet NSTextView *resultView;
@property (assign) IBOutlet NSTextField *userIdField;
@property (assign) IBOutlet NSTextField *tokenField;
@property (assign) IBOutlet NSButton *startButton;

- (void)clearResult:(id)sender;
- (void) updateUserDefaults;
- (void) loadUserDefaults;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace;


@end
