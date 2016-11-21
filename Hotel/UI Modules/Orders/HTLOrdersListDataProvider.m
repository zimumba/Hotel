//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import <FastEasyMapping/FEMDeserializer.h>
#import "HTLOrdersListDataProvider.h"
#import "HTLGlobalUtilities.h"
#import "HTLMenuItem.h"
#import "HTLMenuItem+Mapping.h"

static NSString *const HTLFoodItemsFileName = @"FoodList.plist";
static NSString *const HTLSpaItemsFileName = @"SpaList.plist";
static NSString *const HTLGymItemsFileName = @"GymList.plist";

@interface HTLOrdersListDataProvider ()

@property (nonatomic) NSArray *fetchedObjects;

@property (nonatomic) HTLMenuItem *menuItem;

@end

@implementation HTLOrdersListDataProvider

- (instancetype)initWithMenuItem:(HTLMenuItem *)menuItem {
    self = [super init];
    if (self) {
        _menuItem = menuItem;
    }

    return self;
}

- (id)fetchDataWithSuccess:(HTLDefaultSuccessHandler)success
                   failure:(HTLDefaultFailureHandler)failure {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *filePath = [self filePathForMenuItem:self.menuItem];
        NSArray *menuRepresentation = [[NSArray alloc] initWithContentsOfFile:filePath];

        self.fetchedObjects = [FEMDeserializer collectionFromRepresentation:menuRepresentation mapping:[HTLMenuItem defaultMapping]];

        dispatch_async(dispatch_get_main_queue(), ^{
            htl_safe_block_call(success, self.fetchedObjects);
        });
    });

    return nil;
}

- (NSString *)filePathForMenuItem:(HTLMenuItem *)menuItem {
    NSString *fileName;
    switch (menuItem.actionType) {
        case HTLMenuItemActionTypeShowFood:
            fileName = HTLFoodItemsFileName;
            break;

        case HTLMenuItemActionTypeShowSpa:
            fileName = HTLSpaItemsFileName;
            break;

        case HTLMenuItemActionTypeShowGym:
            fileName = HTLGymItemsFileName;
            break;

        default:
            break;
    }

    return [[NSBundle mainBundle] pathForResource:fileName.stringByDeletingPathExtension
                                           ofType:fileName.pathExtension];
}

@end