//
//  api_curlyAppDelegate.h
//  api_curly
//
//  Created by Daniel Hahn on 02.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "connection_delegate.h"

@interface api_curlyAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSTextField *urlField;
	NSTextView *requestView;
	NSPopUpButton *apiVersionSelector;

	ConnectionDelegate *conDelegate;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *urlField;
@property (assign) IBOutlet NSTextView *requestView;
@property (assign) IBOutlet NSPopUpButton *apiVersionSelector;
@property (assign) IBOutlet ConnectionDelegate *conDelegate;


- (void)sendRequest:(id)sender;
- (void) updateUserDefaults;
- (void) loadUserDefaults;
- (NSString*) selectedApiVersion;

@end
