//
//  AppDelegate.m
//  Hotel
//
//  Created by Antonyo on 11/20/16.
//  Copyright © 2016 aoli. All rights reserved.
//

#import "AppDelegate.h"
#import "HTLServiceLocator.h"

@interface AppDelegate ()

@property (nonatomic) HTLServiceLocator *serviceLocator;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.serviceLocator = [HTLServiceLocator new];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.window.rootViewController = [[CMTDefaultNavigationController alloc] initWithRootViewController:[CMTSegmentedControllersFactory mainScreenSegmentedController]];

    [self.window makeKeyAndVisible];

    return YES;
}

@end
