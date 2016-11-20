//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;

typedef NS_ENUM(NSInteger, HTLMenuItemActionType) {
    HTLMenuItemActionTypeShowFood,
    HTLMenuItemActionTypeShowSpa,
    HTLMenuItemActionTypeShowGym
};

@interface HTLMenuItem : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic) NSInteger order;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *relatedScreenTitle;
@property (nonatomic) HTLMenuItemActionType actionType;

@end