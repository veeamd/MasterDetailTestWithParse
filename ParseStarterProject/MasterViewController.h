//
//  MasterViewController.h
//  MasterDetailsTest
//
//  Created by Wei Zhang on 2/11/15.
//  Copyright (c) 2015 WeiZhang. All rights reserved.
//


#import <UIKit/UIKit.h>


@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end
