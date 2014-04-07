//
//  VSThemeCache.h
//  NeonEngine
//
//  Created by Skye Book on 4/7/14.
//  Copyright (c) 2014 groupneon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSTheme.h"

@interface VSThemeCache : NSObject

+ (VSThemeCache *) sharedThemeCache;

@property (nonatomic, readonly, strong) VSTheme *theme;

@end
