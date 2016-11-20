//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;
#import "HTLBaseParamsContainer.h"

@interface HTLCellParamsContainer : HTLBaseParamsContainer

@property (nonatomic) id object;
@property (nonatomic) NSIndexPath *indexPath;
@property (nonatomic, weak) id delegate;
@property (nonatomic, weak) id listView;

@end