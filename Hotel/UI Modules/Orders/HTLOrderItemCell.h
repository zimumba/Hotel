//
// Created by Antonyo on 11/21/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;
#import "HTLCellParamsContainerDelegate.h"

@class HTLCellParamsContainer;

@interface HTLOrderItemCell : UITableViewCell <HTLCellParamsContainerDelegate>

@property (nonatomic) HTLCellParamsContainer *cellParams;

@end