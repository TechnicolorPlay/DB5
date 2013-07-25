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

- (id)themeValueForKey:(NSString *)key
{
    Class class = [self class];
    
    while (class != [NSObject class])
    {
        id value = [self.theme objectForKey:[NSStringFromClass(class) stringByAppendingFormat:@".%@", key]];
        if (value)
        {
            return value;
        }
        
        class = [class superclass];
    }
    
    return nil;
}

- (BOOL)themeBoolForKey:(NSString *)key
{
    return [[self themeValueForKey:key] boolValue];
}

- (NSString *)themeStringForKey:(NSString *)key
{
    return (NSString *)[self themeValueForKey:key];
}

- (NSInteger)themeIntegerForKey:(NSString *)key
{
    return [[self themeValueForKey:key] integerValue];
}

- (CGFloat)themeFloatForKey:(NSString *)key
{
    return [[self themeValueForKey:key] floatValue];
}

- (UIImage *)themeImageForKey:(NSString *)key
{
    Class class = [self class];
    
    while (class != [NSObject class])
    {
        UIImage *image = [self.theme imageForKey:[NSStringFromClass(class) stringByAppendingFormat:@".%@", key]];
        if (image)
        {
            return image;
        }
        
        class = [class superclass];
    }
    
    return nil;
}

- (UIColor *)themeColorForKey:(NSString *)key
{
    Class class = [self class];
    
    while (class != [NSObject class])
    {
        UIColor *color = [self.theme colorForKey:[NSStringFromClass(class) stringByAppendingFormat:@".%@", key]];
        if (color)
        {
            return color;
        }
        
        class = [class superclass];
    }
    
    return nil;
}

- (UIEdgeInsets)themeEdgeInsetsForKey:(NSString *)key
{
    NSString *string = (NSString *)[self themeValueForKey:key];
    if (string)
    {
        return UIEdgeInsetsFromString(string);
    }
    
    return UIEdgeInsetsZero;
}

- (UIFont *)themeFontForKey:(NSString *)key
{
    Class class = [self class];
    
    while (class != [NSObject class])
    {
        UIFont *font = [self.theme fontForKey:[NSStringFromClass(class) stringByAppendingFormat:@".%@", key]];
        if (font)
        {
            return font;
        }
        
        class = [class superclass];
    }
    
    return nil;
}

- (CGPoint)themePointForKey:(NSString *)key
{
    NSString *string = (NSString *)[self themeValueForKey:key];
    if (string)
    {
        return CGPointFromString(string);
    }
    
    return CGPointZero;
}

- (CGSize)themeSizeForKey:(NSString *)key
{
    NSString *string = (NSString *)[self themeValueForKey:key];
    if (string)
    {
        return CGSizeFromString(string);
    }
    
    return CGSizeZero;
}

- (NSTimeInterval)themeTimeIntervalForKey:(NSString *)key
{
    id obj = [self themeValueForKey:key];
    if (obj)
    {
        return [obj doubleValue];
    }
    
    return 0.0;
}

- (UIViewAnimationOptions)themeCurveForKey:(NSString *)key
{
    Class class = [self class];
    
    while (class != [NSObject class])
    {
        NSString *string = (NSString *)[self themeValueForKey:key];
        if (string)
        {
            return [self.theme curveForKey:[NSStringFromClass(class) stringByAppendingFormat:@".%@", key]];
        }
        
        class = [class superclass];
    }
    
    return (UIViewAnimationOptions)0;
}

- (VSAnimationSpecifier *)themeAnimationSpecifierForKey:(NSString *)key
{
    Class class = [self class];
    
    while (class != [NSObject class])
    {
        NSString *string = (NSString *)[self themeValueForKey:key];
        if (string)
        {
            return [self.theme animationSpecifierForKey:[NSStringFromClass(class) stringByAppendingFormat:@".%@", key]];
        }
        
        class = [class superclass];
    }
    
    return nil;
}

- (VSTextCaseTransform)themeTextCaseTransformForKey:(NSString *)key
{
    Class class = [self class];
    
    while (class != [NSObject class])
    {
        NSString *string = (NSString *)[self themeValueForKey:key];
        if (string)
        {
            return [self.theme textCaseTransformForKey:[NSStringFromClass(class) stringByAppendingFormat:@".%@", key]];
        }
        
        class = [class superclass];
    }
    
    return VSTextCaseTransformNone;
}

@end
