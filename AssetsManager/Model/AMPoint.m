//
//  AMPoint.m
//  AssetsManager
//
//  Created by Dracks on 30/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMPoint.h"

#define kJsonX	@"x"
#define kJsonY	@"y"

@implementation AMPoint
- (id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        _x=[[dict objectForKey:kJsonX] doubleValue];
		_y=[[dict objectForKey:kJsonY] doubleValue];
    }
    return self;
}

- (NSDictionary *)serialize{
	return @{kJsonX: [[NSNumber alloc] initWithDouble:_x], kJsonY: [[NSNumber alloc] initWithDouble:_y]};
}
@end
