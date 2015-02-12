//
//  DetailViewController.h
//  MasterDetailsTest
//
//  Created by Wei Zhang on 2/11/15.
//  Copyright (c) 2015 WeiZhang. All rights reserved.
//


#import <UIKit/UIKit.h>

@class PFObject;
@interface DetailViewController : UIViewController

@property (strong, nonatomic) PFObject *detailItem;

@end
