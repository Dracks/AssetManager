//
//  AMUtils.m
//  AssetsManager
//
//  Created by Dracks on 30/05/14.
//  Copyright (c) 2014 Jaume Singla Valls. All rights reserved.
//

#import "AMUtils.h"

@implementation AMUtils

+ (NSString *)getDocumentsFolder{
	return [[NSString alloc] initWithFormat:@"%@/es.jaumesingla.assetManager/",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]];
}

@end
