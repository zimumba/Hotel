//
// Created by Antonyo on 11/21/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "HTLOrderItemCell.h"
#import "HTLCellParamsContainer.h"
#import "HTLOrderViewModel.h"

@interface HTLOrderItemCell ()

@property (nonatomic, weak) IBOutlet UILabel *orderTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *orderDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *orderPriceLabel;

@property (nonatomic) HTLOrderViewModel *viewModel;

@end

@implementation HTLOrderItemCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self setupViewModel];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.orderDescriptionLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.orderDescriptionLabel.frame);
}

- (void)setupViewModel {
    self.viewModel = [HTLOrderViewModel new];
}

- (void)setCellParams:(HTLCellParamsContainer *)cellParams {
    if (_cellParams != cellParams) {
        _cellParams = cellParams;

        self.viewModel.orderItem = cellParams.object;

        self.orderTitleLabel.text = self.viewModel.orderTitle;
        self.orderDescriptionLabel.text = self.viewModel.orderDescription;
        self.orderPriceLabel.text = self.viewModel.orderPriceString;
    }
}

@end