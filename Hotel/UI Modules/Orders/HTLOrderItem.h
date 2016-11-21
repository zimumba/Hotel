//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;

@interface HTLOrderItem : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic) NSInteger order;
@property (nonatomic) CGFloat price;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *descriptionText;

@end