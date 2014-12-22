//
//  NSDate+TimeZoneConvert.m
//  iCal
//
//  Created by Hale Chan on 12/19/14.
//  Copyright (c) 2014 PapayaMobile Inc. All rights reserved.
//

#import "NSDate+TimeZoneConvert.h"

static const NSInteger dayFlags = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;

@implementation NSDate (TimeZoneConvert)

- (id)beginningOfDayInTimeZone:(NSTimeZone *)timeZone
{
    NSTimeZone *srcTZ = [NSTimeZone defaultTimeZone];
    NSTimeZone *destTZ = timeZone ?: srcTZ;
    return [self beginningOfDayInTimeZone:destTZ fromTimeZone:srcTZ];
}

- (id)endOfDayInTimeZone:(NSTimeZone *)timeZone
{
    NSTimeZone *srcTZ = [NSTimeZone defaultTimeZone];
    NSTimeZone *destTZ = timeZone ?: srcTZ;
    return [self endOfDayInTimeZone:destTZ fromTimeZone:srcTZ];
}

- (id)endOfDayInTimeZone:(NSTimeZone *)destTZ fromTimeZone:(NSTimeZone *)srcTZ
{
    if (!destTZ || !srcTZ) {
        return nil;
    }
    
    NSDate *other = [self dateTimeInTimeZone:destTZ fromTimeZone:srcTZ];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = destTZ;
    
    NSDateComponents *components = [calendar components:dayFlags fromDate:other];
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)beginningOfDayInTimeZone:(NSTimeZone *)destTZ fromTimeZone:(NSTimeZone *)srcTZ
{
    if (!destTZ || !srcTZ) {
        return nil;
    }
    
    NSDate *other = [self dateTimeInTimeZone:destTZ fromTimeZone:srcTZ];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = destTZ;
    
    NSDateComponents *components = [calendar components:dayFlags fromDate:other];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateTimeInTimeZone:(NSTimeZone *)dest fromTimeZone:(NSTimeZone *)src
{
    if (!src || !dest) {
        return nil;
    }
    if ([src isEqual:dest]) {
        return [self copy];
    }
    
    NSTimeInterval interval = [src secondsFromGMT] - [dest secondsFromGMT];
    return [self dateByAddingTimeInterval:interval];
}

@end
