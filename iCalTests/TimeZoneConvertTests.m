//
//  TimeZoneConvertTests.m
//  iCal
//
//  Created by Hale Chan on 12/22/14.
//  Copyright (c) 2014 PapayaMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "NSDate+TimeZoneConvert.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

id (*typed_msgSend)(id obj, SEL op, ...) = (void *)objc_msgSend;

@interface TimeZoneConvertTests : XCTestCase {
    NSDate *_date;
    NSArray *_tzList;
}

@end

@implementation TimeZoneConvertTests

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)setUp {
    [super setUp];
    
    _date = [NSDate date];
    
    NSTimeZone *bjTZ = [NSTimeZone defaultTimeZone];
    NSTimeZone *utcTZ = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSTimeZone *usTZ = [NSTimeZone timeZoneForSecondsFromGMT:-3600*7];
    
    _tzList = @[bjTZ, utcTZ, usTZ];
}

- (void)testBeginningOfDay1
{
    for (NSTimeZone *dest in _tzList) {
        NSDate *date1 = [_date beginningOfDayInTimeZone:dest];
        NSDate *date2 = typed_msgSend(_date, @selector(dateForDayInTimeZone:), dest);
        
        XCTAssert([date1 isEqualToDate:date2], @"Failed! %s:\n (%@)", __FUNCTION__, dest);
    }
}

- (void)testBeginningOfDay2
{
    for (NSTimeZone *src in _tzList) {
        NSMutableArray *others = [_tzList mutableCopy];
        [others removeObject:src];
        
        for (NSTimeZone *dest in others) {
            NSDate *date1 = [_date beginningOfDayInTimeZone:dest fromTimeZone:src];
            NSDate *date2 = typed_msgSend(_date, @selector(dateForDayInTimeZone:fromTimeZone:), dest, src);
            
            XCTAssert([date1 isEqualToDate:date2], @"Failed! %s:\n (%@ => %@)", __FUNCTION__, dest, src);
        }
    }
}

- (void)testEndOfDay1
{
    for (NSTimeZone *dest in _tzList) {
        NSDate *date1 = [_date endOfDayInTimeZone:dest];
        NSDate *date2 = typed_msgSend(_date, @selector(dateForEndOfDayInTimeZone:), dest);
        
        XCTAssert([date1 isEqualToDate:date2], @"Failed! %s:\n (%@)", __FUNCTION__, dest);
    }
}

- (void)testEndOfDay2
{
    for (NSTimeZone *src in _tzList) {
        NSMutableArray *others = [_tzList mutableCopy];
        [others removeObject:src];
        
        for (NSTimeZone *dest in others) {
            NSDate *date1 = [_date endOfDayInTimeZone:dest fromTimeZone:src];
            NSDate *date2 = typed_msgSend(_date, @selector(dateForEndOfDayInTimeZone:fromTimeZone:), dest, src);
            
            XCTAssert([date1 isEqualToDate:date2], @"Failed! %s:\n (%@ => %@)", __FUNCTION__, dest, src);
        }
    }
}

- (void)testDateConvert
{
    for (NSTimeZone *src in _tzList) {
        NSMutableArray *others = [_tzList mutableCopy];
        [others removeObject:src];
        
        for (NSTimeZone *dest in others) {
            NSDate *date1 = [_date dateTimeInTimeZone:dest fromTimeZone:src];
            NSDate *date2 = typed_msgSend(_date, @selector(dateInTimeZone:fromTimeZone:), dest, src);
            
            XCTAssert([date1 isEqualToDate:date2], @"Failed! %s:\n (%@ => %@)", __FUNCTION__, dest, src);
        }
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
