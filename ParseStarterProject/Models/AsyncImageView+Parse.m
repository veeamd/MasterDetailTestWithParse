//
//  AsyncImageView+Parse.m
//  MasterDetailTest
//
//  Created by Wei Zhang on 2/11/15.
//
//

#import "AsyncImageView+Parse.h"
#import <Parse/Parse.h>

@implementation AsyncImageView (Parse)


- (void)setImageWithParseFile:(PFFile *)file {
    self.file = file;
    __weak AsyncImageView *weakSelf = self;
    [self.file getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error && [weakSelf.file.url isEqualToString:file.url]) {
            weakSelf.image = [UIImage imageWithData:imageData];
        } else {
            NSLog(@"retained file is different from the file property");
        }
    }];
}


@end

