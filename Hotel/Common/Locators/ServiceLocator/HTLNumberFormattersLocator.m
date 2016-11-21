//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "HTLNumberFormattersLocator.h"

@implementation HTLNumberFormattersLocator

+ (NSNumberFormatter *)simpleCurrencyNumberFormatter {
    static NSNumberFormatter *numberFormatter;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [NSNumberFormatter new];
        numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        numberFormatter.currencyCode = @"USD";
    });

    return numberFormatter;
}

@end