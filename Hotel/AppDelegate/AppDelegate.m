//
//  AppDelegate.m
//  Hotel
//
//  Created by Antonyo on 11/20/16.
//  Copyright © 2016 aoli. All rights reserved.
//

#import "AppDelegate.h"
#import "HTLServiceLocator.h"
#import "../Common/HTLDefaultNavigationController/HTLDefaultNavigationController.h"
#import "HTLMenuTableViewController.h"
#import "NSObject+HTLClassName.h"

@interface AppDelegate ()

@property (nonatomic) HTLServiceLocator *serviceLocator;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.serviceLocator = [HTLServiceLocator new];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.window.rootViewController = [[HTLDefaultNavigationController alloc] initWithRootViewController:[[HTLMenuTableViewController alloc] initWithNibName:[HTLMenuTableViewController htl_className] bundle:nil]];

    [self.window makeKeyAndVisible];

    return YES;
}

@end
