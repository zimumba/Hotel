//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;

@class HTLMenuItem;

@interface HTLMenuItemViewModel : NSObject

// Input
@property (nonatomic) HTLMenuItem *menuItem;

// Output
@property (nonatomic, copy, readonly) NSString *menuTitle;

@end