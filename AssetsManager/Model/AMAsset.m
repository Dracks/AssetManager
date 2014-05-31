//
//  AMAsset.m
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMAsset.h"
#import "AMPoint.h"

#define kJsonFilename @"filename"
#define kJsonImageSize @"size"
#define kJsonBoundingBox @"bounding_box"

@implementation AMAsset

- (id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if (self){
		
	}
	return self;
}

- (NSDictionary *)serialize{
	NSMutableArray* boundingBox=[[NSMutableArray alloc] init];
	for (AMPoint* p in _boundingBox){
		[boundingBox addObject:[p serialize]];
	}
	return @{
			 kJsonFilename: _filepath,
			 kJsonImageSize: [AMImageSizeUtils toString:_size],
			 kJsonBoundingBox: boundingBox
			 };
}

@end
