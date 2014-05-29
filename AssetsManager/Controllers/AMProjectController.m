//
//  AMProjectController.m
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMProjectController.h"
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
- (IBAction)closeProject:(id)sender {
}
- (IBAction)saveProject:(id)sender {
	if (!_filePath){
		[self saveAsProject:sender];
	}
}
- (IBAction)saveAsProject:(id)sender {
}

@end
