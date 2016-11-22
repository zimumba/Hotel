//
// Created by Antonyo on 11/22/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import <ReactiveCocoa/RACSubscriptingAssignmentTrampoline.h>
#import <ReactiveCocoa/NSObject+RACPropertySubscribing.h>
#import "HTLOrderDetailsViewController.h"
#import "HTLOrderItem.h"
#import "NSObject+HTLClassName.h"
#import "HTLOrderDetailsViewModel.h"

@interface HTLOrderDetailsViewController ()

@property (nonatomic, weak) IBOutlet UILabel *orderTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *orderDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *orderPriceLabel;

@property (nonatomic) HTLOrderItem *orderItem;

@property (nonatomic) HTLOrderDetailsViewModel *viewModel;

- (IBAction)confirmOrderButtonAction:(id)sender;

@end

@implementation HTLOrderDetailsViewController

- (instancetype)initWithOrderItem:(HTLOrderItem *)orderItem {
    self = [super initWithNibName:[self htl_className] bundle:nil];
    if (self) {
        _orderItem = orderItem;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViewModel];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.orderDescriptionLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.orderDescriptionLabel.frame);
}

- (void)setupViewModel {
    self.viewModel = [HTLOrderDetailsViewModel new];

    RAC(self, viewModel.orderItem) = RACObserve(self, orderItem);

    RAC(self, title) = RACObserve(self, viewModel.relatedScreenTitle);
    RAC(self, orderTitleLabel.text) = RACObserve(self, viewModel.orderTitle);
    RAC(self, orderDescriptionLabel.text) = RACObserve(self, viewModel.orderDescription);
    RAC(self, orderPriceLabel.text) = RACObserve(self, viewModel.orderPriceString);
}

#pragma mark - Actions

- (IBAction)confirmOrderButtonAction:(id)sender {
    // Confirmation logic

    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end