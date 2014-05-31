//
//  AMApplicationController.m
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMApplicationController.h"
#import "AMProjectController.h"
#import "AMUtils.h"

@interface AMApplicationController ()<AMProjectControllerDelegate>
@property (nonatomic, weak) IBOutlet NSMenu *recentMenuList;
@property (nonatomic, strong)		NSArray* recentList;
@property(nonatomic, strong)		NSMutableArray* openedWindows;
@end

@implementation AMApplicationController

- (id)init{
	self=[super init];
	id restored=[self restore];
	if (restored){
		self=restored;
		for (NSString* recent in _recentList) {
			[self insertRecentProject:recent];
		}
	} else if (self){
		_recentList=[[NSArray alloc] init];
	}
	_openedWindows=[[NSMutableArray alloc] init];
	return self;
}


- (id) restore{
	id ret=nil;
	@try {
		NSString* savePath=[[NSString alloc] initWithFormat:@"%@/configuration",[AMUtils getDocumentsFolder]];
		ret=[NSKeyedUnarchiver unarchiveObjectWithFile:savePath];
	}
	@catch (NSException *exception) {
	}
	
	return ret;
}

-(void) save{
	NSString* savePath=[[NSString alloc] initWithFormat:@"%@/configuration",[AMUtils getDocumentsFolder]];
	BOOL isDirectory;
	if (![[NSFileManager defaultManager] fileExistsAtPath:savePath isDirectory:&isDirectory]){
		NSString* saveFolder=[savePath stringByDeletingLastPathComponent];
		NSError* error=nil;
		[[NSFileManager defaultManager] createDirectoryAtPath:saveFolder withIntermediateDirectories:YES attributes:nil error:&error];
		if (error){
			NSLog(@"There was the following error creating cache foler: %@", error);
			return;
		}
		
	} else if (isDirectory){
		NSLog(@"Not saved, exist a folder on the destination");
		return;
	}
	[NSKeyedArchiver archiveRootObject:self toFile:savePath];
}

- (void) insertRecentProject: (NSString*) project{
	_recentList=[_recentList arrayByAddingObject:project];
	NSMenuItem* item=[[NSMenuItem alloc] initWithTitle:project action:@selector(openRecentProject:) keyEquivalent:nil];
	[item setTarget:self];
	[_recentMenuList insertItem:item atIndex:0];
}

- (void)onOpenedProject:(NSString *)project{
	NSInteger position=[_recentList indexOfObject:project];
	if (position!=NSNotFound){
		[_recentMenuList removeItemAtIndex:[_recentList count]-position];
		NSMutableArray* mutableArray=[_recentList mutableCopy];
		[mutableArray removeObjectAtIndex:position];
		_recentList=[[NSArray alloc] initWithArray:mutableArray];
	}
	[self insertRecentProject:project];
	[self save];
}

- (void)onOpenedWindow:(NSWindow *)window{
	[_openedWindows addObject:window];
}

- (void)onCloseWindow:(NSWindow *)window{
	
}

- (IBAction)newDocument:(id)sender {
	[self openProject:nil];
}

- (void) openProject: (NSString*) project{
	AMProjectController* projectController=[[AMProjectController alloc] initWithFile:project];
	projectController.delegate=self;
	[projectController openListWindow];
	if (project){
		[self onOpenedProject:project];
	}
}

- (IBAction)openFile:(id)sender {
	NSOpenPanel* openPanel=[NSOpenPanel openPanel];
	[openPanel setPrompt:@"Choose"];
    [openPanel setMessage:@"Choose a directory containing images:"];
    [openPanel setTitle:@"Choose Directory"];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setCanChooseFiles:YES];
	
	NSInteger result = [openPanel runModal];
    if (result == NSOKButton) {
        //[self openBrowserWindowForPath:[[[openPanel URLs] objectAtIndex:0] path]];
		[self openProject:[[[openPanel URLs] objectAtIndex:0] path]];
    }
}

- (void) openRecentProject: (NSMenuItem*) sender{
	[self openProject:sender.title];
}

- (IBAction)clearRecent:(NSMenuItem *)sender {
	for (NSUInteger i=0; i<[_recentList count]; i++){
		[_recentMenuList removeItemAtIndex:0];
	}
	_recentList=[[NSArray alloc] init];
}

- (BOOL)panel:(id)sender shouldShowFilename:(NSString *)filename{
	NSLog(@"Selected: %@", filename);
	AMProjectController* project=[[AMProjectController alloc] initWithFile:filename];
	if (project){
		return YES;
	}
	return NO;
}


@end
