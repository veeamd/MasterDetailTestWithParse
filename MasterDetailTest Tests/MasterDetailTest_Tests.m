//
//  MasterDetailTest_Tests.m
//  MasterDetailTest Tests
//
//  Created by Wei Zhang on 2/11/15.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <Parse/Parse.h>

#import "ParseProxy.h"
#import "AsyncImageView.h"
#import "AsyncImageView+Parse.h"

@interface MasterDetailTest_Tests : XCTestCase

@end

@implementation MasterDetailTest_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetPhotos {
    [[ParseProxy sharedInstance] getAllPhotos:^(NSArray *objects, NSError *error) {
        XCTAssert([objects count] > 0, @"fetched objects shouldn't empty");
        AsyncImageView *asyncImageView = [[AsyncImageView alloc] init];
        for (PFObject *object in objects) {
            [asyncImageView setImageWithParseFile:object[@"image"]];
        }
    }];
}

/*
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
*/
 
@end
