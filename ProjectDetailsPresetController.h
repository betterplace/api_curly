//
//  ProjectDetailsPresetController.h
//  api_curly
//
//  Created by Daniel Hahn on 11.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <BWToolkitFramework/BWToolkitFramework.h>

@interface ProjectDetailsPresetController : NSObject {
	BWTransparentCheckbox* useBasicData;
	BWTransparentCheckbox* useRating;
	BWTransparentCheckbox* useOwner;
	BWTransparentCheckbox* useOrganization;
	BWTransparentCheckbox* useTags;
	BWTransparentCheckbox* useNeeds;
	BWTransparentCheckbox* useNonMonetaryNeeds;
	BWTransparentCheckbox* useSupporters;
	BWTransparentCheckbox* useAdvocates;
	BWTransparentCheckbox* useVisitors;
	BWTransparentCheckbox* useBlogEntries;
	BWTransparentCheckbox* useImages;
	BWTransparentCheckbox* useVideos;
	NSTextView *requestView;
}

@property (assign) IBOutlet BWTransparentCheckbox* useBasicData;
@property (assign) IBOutlet BWTransparentCheckbox* useRating;
@property (assign) IBOutlet BWTransparentCheckbox* useOwner;
@property (assign) IBOutlet BWTransparentCheckbox* useOrganization;
@property (assign) IBOutlet BWTransparentCheckbox* useTags;
@property (assign) IBOutlet BWTransparentCheckbox* useNeeds;
@property (assign) IBOutlet BWTransparentCheckbox* useNonMonetaryNeeds;
@property (assign) IBOutlet BWTransparentCheckbox* useSupporters;
@property (assign) IBOutlet BWTransparentCheckbox* useAdvocates;
@property (assign) IBOutlet BWTransparentCheckbox* useVisitors;
@property (assign) IBOutlet BWTransparentCheckbox* useBlogEntries;
@property (assign) IBOutlet BWTransparentCheckbox* useImages;
@property (assign) IBOutlet BWTransparentCheckbox* useVideos;
@property (assign) IBOutlet NSTextView* requestView;

- (void)generateRequest:(id)sender;

@end
