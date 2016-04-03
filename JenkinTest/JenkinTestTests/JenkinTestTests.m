//
//  JenkinTestTests.m
//  JenkinTestTests
//
//  Created by Amit Kumar Soni on 31/03/16.
//  Copyright © 2016 Amit Kumar Soni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface JumblifyViewControllerTests : XCTestCase

@property (nonatomic) ViewController *vcToTest;

@end

@interface ViewController (Test)

- (NSString *)reverseString:(NSString *)stringToReverse;
- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *))completion;

@end

@implementation JumblifyViewControllerTests

- (void)setUp
{
    [super setUp];
    self.vcToTest = [[ViewController alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testReverseString
{
    NSString *originalString = @"himynameisandy";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    NSString *expectedReversedString = @"asdf";
    XCTAssertEqualObjects(expectedReversedString, reversedString, @"The reversed string did not match the expected reverse");
}

- (void)testPerformanceReverseString
{
    NSString *originalString = @"himynameisandy";
    [self measureBlock:^{
        [self.vcToTest reverseString:originalString];
    }];
}

- (void)testDoSomethingThatTakesSomeTime
{
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Long method"];
    [self.vcToTest doSomethingThatTakesSomeTimesWithCompletionBlock:^(NSString *result) {
        XCTAssertEqualObjects(@"result", result, @"Result was not correct!");
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}
@end
