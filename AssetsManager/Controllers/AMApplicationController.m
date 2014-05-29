//
//  AMApplicationController.m
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMApplicationController.h"
#import "AMProjectController.h"

@implementation AMApplicationController
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
    }
}

- (IBAction)newDocument:(id)sender {
	AMProjectController* project=[[AMProjectController alloc] initWithFile:nil];
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
