//
//  UIView+VSTheme.m
//  NeonEngine
//
//  Created by Eric Robinson on 7/2/13.
//  Copyright (c) 2013 groupneon. All rights reserved.
//

#import "UIView+VSTheme.h"
#import "VSThemeLoader.h"
#import <objc/runtime.h>

static char const * const kVSThemeKey = "kVSTheme";


@implementation UIView (VSTheme)

@dynamic theme;

- (void) setTheme:(VSTheme *)theme
{
    objc_setAssociatedObject(self, kVSThemeKey, theme, OBJC_ASSOCIATION_RETAIN);
}

- (VSTheme*)theme
{
    id theme = objc_getAssociatedObject(self, kVSThemeKey);
    if(theme == nil)
    {
        VSThemeLoader* loader = [[VSThemeLoader alloc] init];
        theme = [loader defaultTheme];
        self.theme = theme;
    }
    
    return theme;
}

@end
