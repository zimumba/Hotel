//
// Created by Antonyo on 11/22/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "HTLOrderDetailsViewModel.h"
#import "HTLOrderItem.h"

@interface HTLOrderDetailsViewModel ()

@property (nonatomic, copy) NSString *relatedScreenTitle;

@end

@implementation HTLOrderDetailsViewModel

- (void)setOrderItem:(HTLOrderItem *)orderItem {
    [super setOrderItem:orderItem];

    self.relatedScreenTitle = orderItem.title;
}

@end