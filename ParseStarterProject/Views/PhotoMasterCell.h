//
//  PhotoMasterCell.h
//  MasterDetailTest
//
//  Created by Wei Zhang on 2/11/15.
//
//

#import <UIKit/UIKit.h>

#import "AsyncImageView.h"

@interface PhotoMasterCell : UITableViewCell

@property (weak, nonatomic) IBOutlet AsyncImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;


@end
