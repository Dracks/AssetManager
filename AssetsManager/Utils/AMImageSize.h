//
//  AMImageSize.h
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

@import Foundation;

typedef enum : NSUInteger {
    AMLittleSize,
    AMMediumSize,
    AMBigSize,
} AMImageSize;

@interface AMImageSizeUtils : NSObject

+ (AMImageSize) fromString: (NSString*) size;
+ (NSString*) toString: (AMImageSize)	size;
@end
