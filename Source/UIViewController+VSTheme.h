//
//  UIViewController+VSTheme.h
//  NeonEngine
//
//  Created by Eric Robinson on 7/2/13.
//  Copyright (c) 2013 groupneon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSTheme.h"

@interface UIViewController (VSTheme)

@property(nonatomic, strong, readwrite) VSTheme* theme;

- (BOOL)themeBoolForKey:(NSString *)key;
- (NSString *)themeStringForKey:(NSString *)key;
- (NSInteger)themeIntegerForKey:(NSString *)key;
- (CGFloat)themeFloatForKey:(NSString *)key;
- (UIImage *)themeImageForKey:(NSString *)key;
- (UIColor *)themeColorForKey:(NSString *)key;
- (UIEdgeInsets)themeEdgeInsetsForKey:(NSString *)key;
- (UIFont *)themeFontForKey:(NSString *)key;
- (CGPoint)themePointForKey:(NSString *)key;
- (CGSize)themeSizeForKey:(NSString *)key;
- (NSTimeInterval)themeTimeIntervalForKey:(NSString *)key;
- (UIViewAnimationOptions)themeCurveForKey:(NSString *)key;
- (VSAnimationSpecifier *)themeAnimationSpecifierForKey:(NSString *)key;
- (VSTextCaseTransform)themeTextCaseTransformForKey:(NSString *)key;

- (CGFloat)themeGridBasis;
- (CGFloat)themeGridFloatForKey:(NSString *)key;
- (UIEdgeInsets)themeGridEdgeInsetsForKey:(NSString *)key;
- (CGPoint)themeGridPointForKey:(NSString *)key;
- (CGSize)themeGridSizeForKey:(NSString *)key;

@end
