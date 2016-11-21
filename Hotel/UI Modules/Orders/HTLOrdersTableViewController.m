//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import <ReactiveCocoa/RACSubscriptingAssignmentTrampoline.h>
#import <ReactiveCocoa/NSObject+RACPropertySubscribing.h>
#import "HTLOrdersTableViewController.h"
#import "HTLMenuItem.h"
#import "NSObject+HTLClassName.h"
#import "HTLMenuItemViewModel.h"

@interface HTLOrdersTableViewController ()

@property (nonatomic) HTLMenuItem *menuItem;

@property (nonatomic) HTLMenuItemViewModel *viewModel;

@end

@implementation HTLOrdersTableViewController

- (instancetype)initWithMenuItem:(HTLMenuItem *)menuItem {
    self = [super initWithNibName:[self htl_className] bundle:nil];
    if (self) {
        _menuItem = menuItem;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViewModel];
}

- (void)setupViewModel {
    self.viewModel = [HTLMenuItemViewModel new];

    RAC(self, viewModel.menuItem) = RACObserve(self, menuItem);

    RAC(self, title) = RACObserve(self, viewModel.relatedScreenTitle);
}

@end