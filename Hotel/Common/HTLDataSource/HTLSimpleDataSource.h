//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;
#import "HTLConstants.h"

@protocol HTLDataProvider;

@interface HTLSimpleDataSource : NSObject

- (instancetype)initWithDataProvider:(id <HTLDataProvider>)dataProvider;

- (id)fetchDataWithSuccess:(HTLDefaultSuccessHandler)success
                   failure:(HTLDefaultFailureHandler)failure;

- (NSInteger)totalObjectsCount;

- (id)objectAtIndex:(NSInteger)index;

@end