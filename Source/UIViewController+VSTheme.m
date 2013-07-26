//
//  UIViewController+VSTheme.m
//  NeonEngine
//
//  Created by Eric Robinson on 7/2/13.
//  Copyright (c) 2013 groupneon. All rights reserved.
//

#import "UIViewController+VSTheme.h"
#import "VSThemeLoader.h"
#import <objc/runtime.h>

static char const * const kVSThemeKey = "kVSTheme";

@implementation UIViewController (VSTheme)

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
    return [self.theme boolForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (NSString *)themeStringForKey:(NSString *)key
{
    return [self.theme stringForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (NSInteger)themeIntegerForKey:(NSString *)key
{
    return [self.theme integerForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (CGFloat)themeFloatForKey:(NSString *)key
{
    return [self.theme floatForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (UIImage *)themeImageForKey:(NSString *)key
{
    return [self.theme imageForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (UIColor *)themeColorForKey:(NSString *)key
{
    return [self.theme colorForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (UIEdgeInsets)themeEdgeInsetsForKey:(NSString *)key
{
    return [self.theme edgeInsetsForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (UIFont *)themeFontForKey:(NSString *)key
{
    return [self.theme fontForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (CGPoint)themePointForKey:(NSString *)key
{
    return [self.theme pointForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (CGSize)themeSizeForKey:(NSString *)key
{
    return [self.theme sizeForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (NSTimeInterval)themeTimeIntervalForKey:(NSString *)key
{
    return [self.theme timeIntervalForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (UIViewAnimationOptions)themeCurveForKey:(NSString *)key
{
    return [self.theme curveForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (VSAnimationSpecifier *)themeAnimationSpecifierForKey:(NSString *)key
{
    return [self.theme animationSpecifierForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (VSTextCaseTransform)themeTextCaseTransformForKey:(NSString *)key
{
    return [self.theme textCaseTransformForKey:[NSStringFromClass([self class]) stringByAppendingString:key]];
}

- (CGFloat)themeGridBasis
{
    return [self.theme floatForKey:@"gridBasis"];
}

- (CGFloat)themeGridFloatForKey:(NSString *)key
{
    CGFloat gridSize = [self themeGridBasis];
    return gridSize * [self themeFloatForKey:key];
}

- (UIEdgeInsets)themeGridEdgeInsetsForKey:(NSString *)key
{
    CGFloat gridSize = [self themeGridBasis];
    UIEdgeInsets insets = [self themeEdgeInsetsForKey:key];
    
    return UIEdgeInsetsMake(insets.top * gridSize, insets.left * gridSize, insets.bottom * gridSize, insets.right * gridSize);
}

- (CGPoint)themeGridPointForKey:(NSString *)key
{
    CGFloat gridSize = [self themeGridBasis];
    CGPoint point = [self themePointForKey:key];
    
    return CGPointMake(point.x * gridSize, point.y * gridSize);
}

- (CGSize)themeGridSizeForKey:(NSString *)key
{
    CGFloat gridSize = [self themeGridBasis];
    CGSize size = [self themeSizeForKey:key];
    
    return CGSizeMake(gridSize * size.width, gridSize * size.height);
}

@end