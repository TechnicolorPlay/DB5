//
//  VSThemeCache.m
//  NeonEngine
//
//  Created by Skye Book on 4/7/14.
//  Copyright (c) 2014 groupneon. All rights reserved.
//

#import "VSThemeCache.h"
#import "VSThemeLoader.h"

@interface VSThemeCache ()
@property (nonatomic, readwrite, strong) VSTheme *theme;
@end

@implementation VSThemeCache

+ (VSThemeCache *) sharedThemeCache
{
    static VSThemeCache *sharedThemeCache = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^
                  {
                      sharedThemeCache = [[VSThemeCache alloc] init];
                  });
    
    return sharedThemeCache;
}

- (id) init
{
    self = [super init];
    if(self)
    {
        DLog(@"LOADING DB5");
        VSThemeLoader* loader = [[VSThemeLoader alloc] init];
        self.theme = [loader defaultTheme];
    }
    return self;
}

@end
