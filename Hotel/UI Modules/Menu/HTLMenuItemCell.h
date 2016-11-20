//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;
#import "HTLCellParamsContainerDelegate.h"

@interface HTLMenuItemCell : UITableViewCell <HTLCellParamsContainerDelegate>

@property (nonatomic) HTLCellParamsContainer *cellParams;

@end