//
//  AsyncImageView.h
//  MasterDetailTest
//
//  Created by Wei Zhang on 2/11/15.
//
//

#import <UIKit/UIKit.h>

@class PFFile;

@interface AsyncImageView : UIImageView

@property (nonatomic, strong) PFFile *file;

@end
