//
//  ProjectDetailsPresetController.m
//  api_curly
//
//  Created by Daniel Hahn on 11.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ProjectDetailsPresetController.h"


@implementation ProjectDetailsPresetController
@synthesize useBasicData, useRating, useOwner, useOrganization, useTags, useNeeds, useNonMonetaryNeeds;
@synthesize useSupporters, useAdvocates, useVisitors, useBlogEntries, useImages, useVideos, requestView;

NSXMLNode* paginatedElement(NSString* name) {
	NSXMLElement* paginatedElement = (NSXMLElement*) [NSXMLNode elementWithName:name];
	[paginatedElement addChild:[NSXMLNode elementWithName:@"page" stringValue:@"1"]];
	[paginatedElement addChild:[NSXMLNode elementWithName:@"per-page" stringValue:@"5"]];
	return paginatedElement;
}

- (void)generateRequest:(id)sender
{
	NSXMLElement *requestRoot = (NSXMLElement*) [NSXMLNode elementWithName:@"request"];
	if ([useBasicData state] == NSOnState) {
		[requestRoot addChild:[NSXMLNode elementWithName:@"basic-data"]];
	}
	if ([useRating state] == NSOnState) {
		[requestRoot addChild:[NSXMLNode elementWithName:@"rating"]];
	}
	if([useOwner state] == NSOnState) {
		[requestRoot addChild:[NSXMLNode elementWithName:@"owner"]];
	}
	if([useOrganization state] == NSOnState) {
		[requestRoot addChild:[NSXMLNode elementWithName:@"organization"]];
	}
	if([useTags state] == NSOnState) {
		[requestRoot addChild:[NSXMLNode elementWithName:@"tags"]];
	}
	if([useNeeds state] == NSOnState) {
		[requestRoot addChild:paginatedElement(@"needs")];
	}
	if([useNonMonetaryNeeds state] == NSOnState) {
		[requestRoot addChild:paginatedElement(@"non-monetary-needs")];
	}
	if([useSupporters state] == NSOnState) {
		[requestRoot addChild:paginatedElement(@"supporters")];
	}
	if([useAdvocates state] == NSOnState) {
		[requestRoot addChild:paginatedElement(@"advocates")];
	}
	if([useVisitors state] == NSOnState) {
		[requestRoot addChild:paginatedElement(@"visitors")];
	}
	if([useBlogEntries state] == NSOnState) {
		[requestRoot addChild:paginatedElement(@"blog-entries")];
	}
	if([useImages state] == NSOnState) {
		[requestRoot addChild:paginatedElement(@"images")];
	}
	if([useVideos state] == NSOnState) {
		[requestRoot addChild:[NSXMLNode elementWithName:@"videos"]];
	}
	NSXMLDocument* request = [[[NSXMLDocument alloc] initWithRootElement:requestRoot] autorelease];
	NSData* requestData = [request XMLDataWithOptions:NSXMLNodePrettyPrint];
	NSString* requestString = [[[NSString alloc] initWithData:requestData encoding:NSUTF8StringEncoding] autorelease];
	[requestView setString:requestString];
}


@end
