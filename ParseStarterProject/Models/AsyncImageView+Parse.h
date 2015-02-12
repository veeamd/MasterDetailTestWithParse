//
//  AsyncImageView+Parse.h
//  MasterDetailTest
//
//  Created by Wei Zhang on 2/11/15.
//
//

#import "AsyncImageView.h"

@class PFFile;

@interface AsyncImageView (Parse)

- (void)setImageWithParseFile:(PFFile *)file;


@end
