//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import <FastEasyMapping/FEMMapping.h>
#import "HTLOrderItem+Mapping.h"

@implementation HTLOrderItem (Mapping)

+ (FEMMapping *)defaultMapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];

    [mapping addAttributesFromDictionary:@{
            @"identifier" : @"uid",
            @"order" : @"order",
            @"title" : @"order_title",
            @"price" : @"price",
            @"descriptionText" : @"description_text"
    }];

    return mapping;
}

@end