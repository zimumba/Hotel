//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;
#import "HTLConstants.h"

@protocol HTLDataProvider <NSObject>

@required
@property (nonatomic, readonly) NSArray *fetchedObjects;

- (id)fetchDataWithSuccess:(HTLDefaultSuccessHandler)success
                   failure:(HTLDefaultFailureHandler)failure;

@end