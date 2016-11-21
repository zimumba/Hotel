//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import <FastEasyMapping/FEMMapping.h>
#import "HTLMenuItem+Mapping.h"

@implementation HTLMenuItem (Mapping)

+ (FEMMapping *)defaultMapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];

    [mapping addAttributesFromDictionary:@{
            @"identifier" : @"uid",
            @"order" : @"order",
            @"title" : @"menu_title",
            @"relatedScreenTitle" : @"related_screen_title",
            @"actionType" : @"action_type"
    }];

    return mapping;
}

@end