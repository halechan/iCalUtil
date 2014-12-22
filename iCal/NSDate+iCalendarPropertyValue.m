//
//  NSDate+iCalendarPropertyValue.m
//  iCal
//
//  Created by Hale Chan on 12/19/14.
//  Copyright (c) 2014 PapayaMobile Inc. All rights reserved.
//

#import "NSDate+iCalendarPropertyValue.h"

@implementation NSDate (iCalendarPropertyValue)

- (NSString *)iCalendarDateString
{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    return [NSString stringWithFormat:@"%.4d%.2d%.2d", (int)components.year, (int)components.month, (int)components.day];
}

- (NSString *)iCalendarLocalTimeString
{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self];
    return [NSString stringWithFormat:@"%.2d%.2d%.2d", (int)components.hour, (int)components.minute, (int)components.second];
}

- (NSString *)iCalendarUTCTimeString
{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self];
    return [NSString stringWithFormat:@"%.2d%.2d%.2dZ", (int)components.hour, (int)components.minute, (int)components.second];
}

- (NSString *)iCalendarLocalDateTimeString
{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self];
    return [NSString stringWithFormat:@"%.4d%.2d%.2dT%.2d%.2d%.2d", (int)components.year, (int)components.month, (int)components.day, (int)components.hour, (int)components.minute, (int)components.second];
}

- (NSString *)iCalendarUTCDateTimeString
{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self];
    return [NSString stringWithFormat:@"%.4d%.2d%.2dT%.2d%.2d%.2dZ", (int)components.year, (int)components.month, (int)components.day, (int)components.hour, (int)components.minute, (int)components.second];
}

@end
