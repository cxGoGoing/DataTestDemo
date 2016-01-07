//
//  ControllerTest.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/7.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MainViewController.h"
@interface ControllerTest : XCTestCase
@end

@implementation ControllerTest

- (void)setUp {
    [super setUp];
    MainViewController * mainVc = [[MainViewController alloc]init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
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

    }];
}

@end
