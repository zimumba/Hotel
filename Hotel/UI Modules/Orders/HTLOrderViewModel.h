//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;

@class HTLOrderItem;

@interface HTLOrderViewModel : NSObject

// Input
@property (nonatomic) HTLOrderItem *orderItem;

// Output
@property (nonatomic, copy, readonly) NSString *orderTitle;
@property (nonatomic, copy, readonly) NSString *orderDescription;
@property (nonatomic, copy, readonly) NSString *orderPriceString;

@end