//
//  MasterViewController.m
//  MasterDetailsTest
//
//  Created by Wei Zhang on 2/11/15.
//  Copyright (c) 2015 WeiZhang. All rights reserved.
//


#import "MasterViewController.h"
#import "DetailViewController.h"

#import "ParseProxy.h"

#import "PhotoMasterCell.h"
#import "AsyncImageView+Parse.h"

@interface MasterViewController ()

@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;


@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(fetchAllPhotos)];
    self.navigationItem.rightBarButtonItem = refreshButton;

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self fetchAllPhotos];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers
- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateFormat = @"MM/dd/yyyy, HH:mm";
    }
    return _dateFormatter;
}

- (void)fetchAllPhotos {
    [[ParseProxy sharedInstance] getAllPhotos:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved %li scores.", (long)objects.count);
            self.photos = objects;
            [self.tableView reloadData];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

#pragma mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *object = self.photos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoMasterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoMasterCell" forIndexPath:indexPath];
    PFObject *object = self.photos[indexPath.row];

    [cell.photoImageView setImageWithParseFile:object[@"image"]];
    cell.titleLbl.text = object[@"title"];
    cell.dateLbl.text = [self.dateFormatter stringFromDate:object.createdAt];

    return cell;
}




@end