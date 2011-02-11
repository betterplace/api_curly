//
//  ServicePanelDelegate.m
//  api_curly
//
//  Created by Daniel Hahn on 10.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ServicePanelDelegate.h"


@implementation ServicePanelDelegate

- (void)windowDidBecomeKey:(NSNotification*) notification {
	[((NSWindow*) [notification object]) setFrameTopLeftPoint:[NSEvent mouseLocation]];
}

@end
