//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import <FastEasyMapping/FEMDeserializer.h>
#import "HTLMenuDataProvider.h"
#import "HTLMenuItem.h"
#import "HTLMenuItem+Mapping.h"
#import "HTLGlobalUtilities.h"

static NSString *const HTLMenuItemsFileName = @"Menu.plist";

@interface HTLMenuDataProvider ()

@property (nonatomic) NSArray *fetchedObjects;

@end

@implementation HTLMenuDataProvider

- (id)fetchDataWithSuccess:(HTLDefaultSuccessHandler)success
                   failure:(HTLDefaultFailureHandler)failure {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:HTLMenuItemsFileName.stringByDeletingPathExtension
                                                             ofType:HTLMenuItemsFileName.pathExtension];
        NSArray *menuRepresentation = [[NSArray alloc] initWithContentsOfFile:filePath];

        self.fetchedObjects = [FEMDeserializer collectionFromRepresentation:menuRepresentation mapping:[HTLMenuItem defaultMapping]];

        dispatch_async(dispatch_get_main_queue(), ^{
            htl_safe_block_call(success, self.fetchedObjects);
        });
    });

    return nil;
}

@end