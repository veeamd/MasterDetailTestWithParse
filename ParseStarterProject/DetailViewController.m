//
//  DetailViewController.m
//  MasterDetailsTest
//
//  Created by Wei Zhang on 2/11/15.
//  Copyright (c) 2015 WeiZhang. All rights reserved.
//


#import "DetailViewController.h"
#import <Parse/Parse.h>
#import "ParseProxy.h"
#import "AsyncImageView.h"
#import "AsyncImageView+Parse.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet AsyncImageView *detailImageView;

@end

@implementation DetailViewController


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.navigationItem.title = self.detailItem[@"title"];
        self.detailDescriptionLabel.text = self.detailItem[@"description"];
        [self.detailImageView setImageWithParseFile:self.detailItem[@"image"]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end