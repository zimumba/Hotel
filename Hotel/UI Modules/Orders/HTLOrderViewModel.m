//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "HTLOrderViewModel.h"
#import "HTLOrderItem.h"
#import "HTLNumberFormattersLocator.h"

@interface HTLOrderViewModel ()

@property (nonatomic, copy) NSString *orderTitle;
@property (nonatomic, copy) NSString *orderDescription;
@property (nonatomic, copy) NSString *orderPriceString;

@end

@implementation HTLOrderViewModel

- (void)setOrderItem:(HTLOrderItem *)orderItem {
    if (_orderItem != orderItem) {
        _orderItem = orderItem;

        self.orderTitle = orderItem.title;
        self.orderDescription = orderItem.descriptionText;
        self.orderPriceString = [[HTLNumberFormattersLocator simpleCurrencyNumberFormatter] stringFromNumber:@(orderItem.price)];
    }
}

@end