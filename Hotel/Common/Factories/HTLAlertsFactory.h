//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;

@interface HTLAlertsFactory : NSObject

+ (UIAlertController *)errorAlertControllerWithErrorMessage:(NSString *)errorMessage;
+ (UIAlertController *)infoAlertControllerWithMessage:(NSString *)message;

@end