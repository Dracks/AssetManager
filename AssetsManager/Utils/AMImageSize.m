//
//  AMImageSize.m
//  AssetsManager
//
//  Created by Dracks on 29/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMImageSize.h"

#define kBig	@"big"
#define kMedium	@"medium"
#define kLittle	@"little"

@implementation AMImageSizeUtils

+ (AMImageSize)fromString:(NSString *)size{
	if ([size isEqualToString:kBig])
		return AMBigSize;
	
	if ([size isEqualToString:kMedium])
		return AMMediumSize;

	if ([size isEqualToString:kLittle])
		return AMLittleSize;
	NSAssert(false, @"no no no!2");
	return -1;
}

+ (NSString *)toString:(AMImageSize)size{
	switch (size) {
		case AMBigSize:
			return kBig;
			break;
		case AMMediumSize:
			return kMedium;
			break;
		case AMLittleSize:
			return kLittle;
			break;
		default:
			break;
	}
	NSAssert(false, @"No no no!");
	return nil;
}
@end
