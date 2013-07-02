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

@end
