//
//  AppDelegate.h
//  Hotel
//
//  Created by Antonyo on 11/20/16.
//  Copyright © 2016 aoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTLServiceLocator;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic) UIWindow *window;

@property (nonatomic, readonly) HTLServiceLocator *serviceLocator;

@end

