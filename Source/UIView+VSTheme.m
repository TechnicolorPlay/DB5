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

- (BOOL)themeBoolForKey:(NSString *)key
{
    return [self.theme boolForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (NSString *)themeStringForKey:(NSString *)key
{
    return [self.theme stringForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (NSInteger)themeIntegerForKey:(NSString *)key
{
    return [self.theme integerForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (CGFloat)themeFloatForKey:(NSString *)key
{
    return [self.theme floatForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (UIImage *)themeImageForKey:(NSString *)key
{
    return [self.theme imageForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (UIColor *)themeColorForKey:(NSString *)key
{
    return [self.theme colorForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (UIEdgeInsets)themeEdgeInsetsForKey:(NSString *)key
{
    return [self.theme edgeInsetsForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (UIFont *)themeFontForKey:(NSString *)key
{
    return [self.theme fontForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (CGPoint)themePointForKey:(NSString *)key
{
    return [self.theme pointForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (CGSize)themeSizeForKey:(NSString *)key
{
    return [self.theme sizeForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (NSTimeInterval)themeTimeIntervalForKey:(NSString *)key
{
    return [self.theme timeIntervalForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (UIViewAnimationOptions)themeCurveForKey:(NSString *)key
{
    return [self.theme curveForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (VSAnimationSpecifier *)themeAnimationSpecifierForKey:(NSString *)key
{
    return [self.theme animationSpecifierForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

- (VSTextCaseTransform)themeTextCaseTransformForKey:(NSString *)key
{
    return [self.theme textCaseTransformForKey:[NSStringFromClass([self class]) stringByAppendingFormat:@".%@", key]];
}

@end
