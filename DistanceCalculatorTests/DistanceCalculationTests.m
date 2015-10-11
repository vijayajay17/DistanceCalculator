
//
//  DistanceCalculationTests.m
//  DistanceCalculator
//
//  Created by Vijay on 10/11/15.
//  Copyright © 2015 Vijay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DistanceCalculationClass.h"

@interface DistanceCalculationTests : XCTestCase
@property(nonatomic) DistanceCalculationClass *distanceCalculationClass;
@end

@implementation DistanceCalculationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.distanceCalculationClass = [[DistanceCalculationClass alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReadingContentsofFile
{
    NSString *readContentsOfFile = [self.distanceCalculationClass readContentsOfFile];
    XCTAssertNotNil(readContentsOfFile);
}

- (void)testDistanceCalculation
{
    NSMutableArray *customerListArray = [self.distanceCalculationClass calculateDistance];
    XCTAssertNotNil(customerListArray);
    XCTAssertEqual(customerListArray.count, 16);
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
