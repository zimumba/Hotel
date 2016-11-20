//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "HTLMenuItemCell.h"
#import "HTLMenuItemViewModel.h"
#import "HTLCellParamsContainer.h"

@interface HTLMenuItemCell ()

@property (nonatomic, weak) IBOutlet UILabel *menuTitleLabel;

@property (nonatomic) HTLMenuItemViewModel *viewModel;

@end

@implementation HTLMenuItemCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self setupViewModel];
}

- (void)setupViewModel {
    self.viewModel = [HTLMenuItemViewModel new];
}

- (void)setCellParams:(HTLCellParamsContainer *)cellParams {
    if (_cellParams != cellParams) {
        _cellParams = cellParams;

        self.viewModel.menuItem = cellParams.object;

        self.menuTitleLabel.text = self.viewModel.menuTitle;
    }
}

@end