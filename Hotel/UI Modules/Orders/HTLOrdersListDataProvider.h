//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;
#import "HTLConstants.h"
#import "HTLDataProvider.h"

@class HTLMenuItem;

@interface HTLOrdersListDataProvider : NSObject <HTLDataProvider>

@property (nonatomic, readonly) NSArray *fetchedObjects;

- (instancetype)initWithMenuItem:(HTLMenuItem *)menuItem;

- (id)fetchDataWithSuccess:(HTLDefaultSuccessHandler)success
                   failure:(HTLDefaultFailureHandler)failure;

@end