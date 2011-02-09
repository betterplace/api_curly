//
//  api_curlyAppDelegate.h
//  api_curly
//
//  Created by Daniel Hahn on 02.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface api_curlyAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSTextField *urlField;
	NSTextField *tokenField;
	NSTextField *requestField;
	NSTextView *resultView;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *urlField;
@property (assign) IBOutlet NSTextField *tokenField;
@property (assign) IBOutlet NSTextField *requestField;
@property (assign) IBOutlet NSTextView *resultView;

- (void)sendRequest:(id)sender;

- (void)clearResult:(id)sender;

- (void) updateUserDefaults;

- (void) loadUserDefaults;

@end
