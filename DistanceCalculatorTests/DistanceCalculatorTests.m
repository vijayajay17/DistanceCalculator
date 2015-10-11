//
//  DistanceCalculatorTests.m
//  DistanceCalculatorTests
//
//  Created by Vijay on 10/10/15.
//  Copyright © 2015 Vijay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "JSONDeserializer.h"
#import "DistanceCalculationClass.h"

@interface DistanceCalculatorTests : XCTestCase
@property(nonatomic)ViewController *viewControllerObj;
@property(nonatomic)DistanceCalculationClass *distanceCalculationClassObj;
@end

@implementation DistanceCalculatorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.viewControllerObj = [[ViewController alloc] init];
    self.distanceCalculationClassObj = [[DistanceCalculationClass alloc] init];
}

-(void)testDeserialise
{
    NSString *userDetailsContentData = [self.distanceCalculationClassObj readContentsOfFile];
    NSArray *customerListDataArray = [JSONDeserializer deserializedDataFromCalculationClass:userDetailsContentData];
    XCTAssertEqual(customerListDataArray.count,32);
}

-(void)testCustomerListWithinRange
{
    NSMutableArray *unsortedCustomerListArray = [self.distanceCalculationClassObj calculateDistance];
    XCTAssertEqual(unsortedCustomerListArray.count,16);
}

-(void)testTableRowsShouldBeEqual
{
    NSMutableArray *unsortedCustomerListArray = [self.distanceCalculationClassObj calculateDistance];
    XCTAssertEqual(16, (int)unsortedCustomerListArray.count);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
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
