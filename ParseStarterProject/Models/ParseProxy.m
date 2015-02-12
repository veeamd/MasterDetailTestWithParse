//
//  ParseProxy.m
//  MasterDetailTest
//
//  Created by Wei Zhang on 2/11/15.
//
//

#import "ParseProxy.h"

@interface ParseProxy ()

@end

@implementation ParseProxy

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static ParseProxy *shared;
    dispatch_once(&once, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}

- (void)getAllPhotos:(void (^)(NSArray *, NSError *))complete {
    PFQuery *query = [PFQuery queryWithClassName:@"Photo"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        complete(objects, error);
    }];
}

@end
