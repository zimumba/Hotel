//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "HTLSimpleDataSource.h"
#import "HTLDataProvider.h"
#import "HTLGlobalUtilities.h"

@interface HTLSimpleDataSource ()

@property (nonatomic) id <HTLDataProvider> dataProvider;

@property (nonatomic) NSArray *fetchedObjects;

@end

@implementation HTLSimpleDataSource

- (instancetype)initWithDataProvider:(id <HTLDataProvider>)dataProvider {
    self = [super init];
    if (self) {
        _dataProvider = dataProvider;
    }

    return self;
}

- (id)fetchDataWithSuccess:(HTLDefaultSuccessHandler)success
                   failure:(HTLDefaultFailureHandler)failure {
    @weakify(self);
    return [self.dataProvider fetchDataWithSuccess:^(NSArray *objects) {
        @strongify(self);
        self.fetchedObjects = objects;

        htl_safe_block_call(success, objects);
    } failure:failure];
}

- (NSInteger)totalObjectsCount {
    return self.fetchedObjects.count;
}

- (id)objectAtIndex:(NSInteger)index {
    return self.fetchedObjects[(NSUInteger) index];
}

@end