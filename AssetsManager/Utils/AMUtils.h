//
//  AMUtils.h
//  AssetsManager
//
//  Created by Dracks on 30/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import <Foundation/Foundation.h>

#define mEncodeObject(x)	[aCoder encodeObject:x forKey:OBJC_STRINGIFY(x)]
#define mDecodeObject(x)	x = [aDecoder decodeObjectForKey:OBJC_STRINGIFY(x)]

@interface AMUtils : NSObject

+ (NSString*) getDocumentsFolder;

@end
