//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;

@class HTLCellParamsContainer;

@protocol HTLCellParamsContainerDelegate <NSObject>

@required
@property (nonatomic) HTLCellParamsContainer *cellParams;

@end