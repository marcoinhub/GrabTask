//
//  AppDelegate.h
//  GrabTask
//
//  Created by John on 15/9/8.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "GiftViewController.h"
#import "TaskViewController.h"
#import "MineViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    UINavigationController *navigationController;

    UITabBarController *tabBarViewController;

}

@property (strong, nonatomic) UIWindow *window;


@end

