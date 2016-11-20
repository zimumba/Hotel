//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "HTLMenuTableViewController.h"
#import "HTLSimpleDataSource.h"
#import "HTLMenuDataProvider.h"
#import "HTLAlertsFactory.h"
#import "HTLMenuItemCell.h"
#import "NSObject+HTLClassName.h"
#import "HTLCellParamsContainer.h"

@interface HTLMenuTableViewController ()

@property (nonatomic) HTLSimpleDataSource *dataSource;

@end

@implementation HTLMenuTableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Menu", @"");
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureTableView];
    [self setupDataSource];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow
                                  animated:YES];
}

- (void)setupDataSource {
    self.dataSource = [[HTLSimpleDataSource alloc] initWithDataProvider:[HTLMenuDataProvider new]];

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

- (void)configureTableView {
    [self.tableView registerNib:[UINib nibWithNibName:[HTLMenuItemCell htl_className] bundle:nil]
         forCellReuseIdentifier:[HTLMenuItemCell htl_className]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource totalObjectsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTLMenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:[HTLMenuItemCell htl_className]];
    cell.cellParams = [self cellParamsForRowAtIndexPath:indexPath];

    return cell;
}

- (HTLCellParamsContainer *)cellParamsForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTLCellParamsContainer *cellParamsContainer = [HTLCellParamsContainer new];
    cellParamsContainer.object = [self.dataSource objectAtIndex:indexPath.row];

    return cellParamsContainer;
}

#pragma mark - UITableViewDelegate

@end