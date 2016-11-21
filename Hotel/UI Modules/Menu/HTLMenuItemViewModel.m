//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "HTLMenuItemViewModel.h"
#import "HTLMenuItem.h"

@interface HTLMenuItemViewModel ()

@property (nonatomic, copy) NSString *menuTitle;
@property (nonatomic, copy) NSString *relatedScreenTitle;

@end

@implementation HTLMenuItemViewModel

- (void)setMenuItem:(HTLMenuItem *)menuItem {
    if (_menuItem != menuItem) {
        _menuItem = menuItem;

        self.menuTitle = menuItem.title;
        self.relatedScreenTitle = menuItem.relatedScreenTitle;
    }
}


@end