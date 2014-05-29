//
//  AMListWindowController.m
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMListWindowController.h"

@interface AMListWindowController ()
@property(nonatomic, retain) AMProjectController* projectController;
@end

@implementation AMListWindowController

- (id)initWithProject:(AMProjectController *)project
{
    self = [super initWithWindowNibName:@"AMListWindowController"];
    if (self) {
		_projectController=project;
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
