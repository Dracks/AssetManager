//
//  AMProjectController.h
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

@import Cocoa;

@protocol AMProjectControllerDelegate <NSObject>

- (void) onOpenedProject: (NSString*) project;
- (void) onOpenedWindow: (NSWindow*) window;
- (void) onCloseWindow: (NSWindow*) window;

@end

@interface AMProjectController : NSObjectController

@property(nonatomic, weak) id<AMProjectControllerDelegate> delegate;
- (id)initWithFile: (NSString*) file;
- (void) openListWindow;
- (NSData*) serialize;
@end
