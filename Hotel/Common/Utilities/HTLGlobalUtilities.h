@import Foundation;
#import "AppDelegate.h"
#import "HTLServiceLocator.h"

#define htl_safe_block_call(block, ...) block ? block(__VA_ARGS__) : nil

#define keypathClassInstance( CLASS, KEYPATH ) keypath(CLASS.new, KEYPATH)

#define HTL_APP_DELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define HTL_SERVICE_LOCATOR CMT_APP_DELEGATE.serviceLocator