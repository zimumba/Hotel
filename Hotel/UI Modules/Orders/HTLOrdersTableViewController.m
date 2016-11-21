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
#import "HTLOrderItemCell.h"
#import "HTLSimpleDataSource.h"
#import "HTLOrdersListDataProvider.h"
#import "HTLAlertsFactory.h"
#import "HTLCellParamsContainer.h"

@interface HTLOrdersTableViewController ()

@property (nonatomic) HTLMenuItem *menuItem;

@property (nonatomic) HTLMenuItemViewModel *viewModel;

@property (nonatomic) HTLSimpleDataSource *dataSource;

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

    [self configureTableView];
    [self setupViewModel];
    [self setupDataSource];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow
                                  animated:YES];
}

- (void)setupViewModel {
    self.viewModel = [HTLMenuItemViewModel new];

    RAC(self, viewModel.menuItem) = RACObserve(self, menuItem);

    RAC(self, title) = RACObserve(self, viewModel.relatedScreenTitle);
}

- (void)configureTableView {
    [self.tableView registerNib:[UINib nibWithNibName:[HTLOrderItemCell htl_className] bundle:nil]
         forCellReuseIdentifier:[HTLOrderItemCell htl_className]];
}

- (void)setupDataSource {
    self.dataSource = [[HTLSimpleDataSource alloc] initWithDataProvider:[[HTLOrdersListDataProvider alloc] initWithMenuItem:self.menuItem]];

    @weakify(self);
    [self.dataSource fetchDataWithSuccess:^(id object) {
        @strongify(self);
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        @strongify(self);
        UIAlertController *alertController = [HTLAlertsFactory errorAlertControllerWithErrorMessage:error.localizedDescription];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource totalObjectsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTLOrderItemCell *cell = [tableView dequeueReusableCellWithIdentifier:[HTLOrderItemCell htl_className]];
    cell.cellParams = [self cellParamsForRowAtIndexPath:indexPath];

    return cell;
}

- (HTLCellParamsContainer *)cellParamsForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTLCellParamsContainer *cellParamsContainer = [HTLCellParamsContainer new];
    cellParamsContainer.object = [self.dataSource objectAtIndex:indexPath.row];

    return cellParamsContainer;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end