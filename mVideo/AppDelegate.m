//
//  AppDelegate.m
//  PP
//
//  Created by Nguyen Tran on 7/7/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setUp];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

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

#pragma mark - Private Methods

- (void)setUp {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:MAIN_STORYBOARD bundle:nil];
    UIViewController *leftVC = [storyboard instantiateViewControllerWithIdentifier:LEFT_SLIDE_DRAWER_VIEW_CONTROLLER];
    UINavigationController *leftNVC = [[UINavigationController alloc] initWithRootViewController:leftVC];
    
    UIViewController *centerVC = [storyboard instantiateViewControllerWithIdentifier:CENTER_VIEW_CONTROLLER];
    UINavigationController *centerNVC = [[UINavigationController alloc] initWithRootViewController:centerVC];
    
    MMDrawerController *drawerVC = [[MMDrawerController alloc] initWithCenterViewController:centerNVC leftDrawerViewController:leftNVC];
    [drawerVC setShowsShadow:NO];
    [drawerVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:drawerVC];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

@end
