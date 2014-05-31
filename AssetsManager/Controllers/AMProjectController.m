//
//  AMProjectController.m
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMProjectController.h"
#import "AMListWindowController.h"
#import "AMAsset.h"

@interface AMProjectController ()
@property(nonatomic, strong)	NSString*		filePath;
@property(nonatomic, strong)	NSMutableArray*	contents;
@end


@implementation AMProjectController

- (id)initWithFile:(NSString *)file{
	self=[super init];
	if (self){
		_filePath=file;
		_contents=[[NSMutableArray alloc] init];
		if (_filePath){
			NSError* error=nil;
			NSData* jsonData=[[NSData alloc] initWithContentsOfFile:_filePath];
			if (!jsonData){
				NSLog(@"There was an error reading the file: %@", file);
				return nil;
			}
			NSArray* listContents=[NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
			if (error){
				NSLog(@"There was an error parsing the file: %@", error);
				return nil;
			}
			for (NSDictionary* assetDict in listContents){
				AMAsset* newAsset=[[AMAsset alloc] initWithDictionary:assetDict];
				[_contents addObject:newAsset];
			}
		}
	}
	return self;
}

- (void) openListWindow{
	AMListWindowController* listController=[[AMListWindowController alloc] initWithProject:self];
	[listController.window makeKeyAndOrderFront:self];
	[listController showWindow:self];
	[_delegate onOpenedWindow:[listController window]];
}

- (IBAction)closeProject:(id)sender {
}
- (IBAction)saveProject:(id)sender {
	if (!_filePath){
		[self saveAsProject:sender];
	} else {
		NSData* data=[self serialize];
		[data writeToFile:_filePath atomically:YES];
	}
}
- (IBAction)saveAsProject:(id)sender {
	/* Select save as */
	[_delegate onOpenedProject:_filePath];
}

- (NSData *)serialize{
	NSError* err=nil;
	NSMutableArray* copy=[[NSMutableArray alloc] init];
	for (AMAsset* asset in _contents){
		[copy addObject:[asset serialize]];
	}
	NSData* ret=[NSJSONSerialization dataWithJSONObject:copy options:NSJSONWritingPrettyPrinted error:&err];
	if (err){
		NSLog(@"Serialize with error: %@", err);
	}
	return ret;
}

@end
