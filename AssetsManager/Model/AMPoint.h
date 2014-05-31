//
//  AMPoint.h
//  AssetsManager
//
//  Created by Dracks on 30/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

@import Foundation;

@interface AMPoint : NSObject
@property(nonatomic)	float	x;
@property(nonatomic)	float	y;

- (id)initWithDictionary: (NSDictionary*) dict;
- (NSDictionary*) serialize;
@end
