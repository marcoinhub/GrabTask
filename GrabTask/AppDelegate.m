//
//  AppDelegate.m
//  GrabTask
//
//  Created by John on 15/9/8.
//  Copyright (c) 2015年 John. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    tabBarViewController =[[UITabBarController alloc] init];
    [self.window setRootViewController:tabBarViewController];
    
    HomeViewController* home = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    GiftViewController* gift = [[GiftViewController alloc] initWithNibName:@"GiftViewController" bundle:nil];
    TaskViewController* task = [[TaskViewController alloc] initWithNibName:@"TaskViewController" bundle:nil];
    MineViewController* mine = [[MineViewController alloc] initWithNibName:@"MineViewController" bundle:nil];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:home];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:gift];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:task];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:mine];
 
    tabBarViewController.viewControllers = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4, nil];
    
    UITabBar*tabBar = tabBarViewController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    tabBarItem1.title = @"首页";
    tabBarItem2.title = @"有钱拿";
    tabBarItem3.title = @"免费抢";
    tabBarItem4.title = @"我的";
    
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@""] withFinishedUnselectedImage:[UIImage imageNamed:@""]];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@""] withFinishedUnselectedImage:[UIImage imageNamed:@""]];
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@""] withFinishedUnselectedImage:[UIImage imageNamed:@""]];
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@""] withFinishedUnselectedImage:[UIImage imageNamed:@""]];
    
    UIImage* tabBarBackground = [UIImage imageNamed:@""];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@""]];
    
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    //                                                       [UIColor whiteColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    //    UIColor *titleHighlightedColor = UIColorFrom0xRGBWithAlpha(0x18222d, 1.0);
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    //                                                       titleHighlightedColor, UITextAttributeTextColor,nil] forState:UIControlStateHighlighted];
    self.window.rootViewController = tabBarViewController;
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
