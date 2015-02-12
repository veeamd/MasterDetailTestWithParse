//
//  ParseProxy.h
//  MasterDetailTest
//
//  Created by Wei Zhang on 2/11/15.
//
//

#import <Foundation/Foundation.h>

#import <Parse/Parse.h>

@interface ParseProxy : NSObject

+ (instancetype)sharedInstance;

- (void)getAllPhotos:(void (^)(NSArray *objects, NSError *error))complete;

@end
