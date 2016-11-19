//
//  UIBarButtonItem+Extension.h
//  PresentSay
//
//  Created by 张俊辉 on 15/12/29.
//  Copyright © 2015年 张俊辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end
