//
//  AMAsset.h
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

@import Foundation;
#import "AMImageSize.h"

@interface AMAsset : NSObject
- (id)initWithDictionary: (NSDictionary*) dictionary;

@property(nonatomic, retain)	NSString*		filepath;
@property(nonatomic)			AMImageSize		size;
@property(nonatomic, retain)	NSArray*		boundingBox;

@end
