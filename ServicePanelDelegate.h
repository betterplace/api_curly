//
//  ServicePanelDelegate.h
//  api_curly
//
//  Created by Daniel Hahn on 10.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ServicePanelDelegate : NSObject <NSWindowDelegate> {

}

- (void)windowDidBecomeKey:(NSNotification*) notification;

@end
