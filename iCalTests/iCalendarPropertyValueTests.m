//
//  iCalendarPropertyValueTests.m
//  iCal
//
//  Created by Hale Chan on 12/19/14.
//  Copyright (c) 2014 PapayaMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSDate+iCalendarPropertyValue.h"

@interface iCalendarPropertyValueTests:XCTestCase {
    NSDate *_date;
}

@end

@implementation iCalendarPropertyValueTests

- (void)setUp {
    [super setUp];
    
    NSDateComponents *compoents = [[NSDateComponents alloc]init];
    compoents.year = 2014;
    compoents.month = 12;
    compoents.day = 22;
    compoents.hour = 17;
    compoents.minute = 01;
    compoents.second = 05;

    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    _date = [calendar dateFromComponents:compoents];
}

- (void)testICalendarValue {
    NSString *string;
    
    string = [_date iCalendarDateString];
    XCTAssert([string isEqualToString:@"20141222"], @"%s", __FUNCTION__);
    
    string = [_date iCalendarLocalTimeString];
    XCTAssert([string isEqualToString:@"170105"], @"%s", __FUNCTION__);
    
    string = [_date iCalendarUTCTimeString];
    XCTAssert([string isEqualToString:@"170105Z"], @"%s", __FUNCTION__);
    
    string = [_date iCalendarLocalDateTimeString];
    XCTAssert([string isEqualToString:@"20141222T170105"], @"%s", __FUNCTION__);
    
    string = [_date iCalendarUTCDateTimeString];
    XCTAssert([string isEqualToString:@"20141222T170105Z"], @"%s", __FUNCTION__);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

#pragma clang diagnostic pop
