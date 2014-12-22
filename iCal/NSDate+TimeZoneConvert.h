//
//  NSDate+TimeZoneConvert.h
//  iCal
//
//  Created by Hale Chan on 12/19/14.
//  Copyright (c) 2014 PapayaMobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TimeZoneConvert)

/**
 *  Creates and returns an NSDate object set to end of that day.
 *
 *  @param timeZone the destination time zone. Should not be nil.
 *
 *  @return a NSDate object.
 */
- (NSDate *)endOfDayInTimeZone:(NSTimeZone *)timeZone;

/**
 *  Creates and returns an NSDate object set to end of that day.
 *
 *  @param dest the destination time zone. Should not be nil.
 *  @param src  the original time zone. Should not be nil.
 *
 *  @return a NSDate object.
 */
- (NSDate *)endOfDayInTimeZone:(NSTimeZone *)dest fromTimeZone:(NSTimeZone *)src;

/**
 *  Creates and returns an NSDate object set to beginning of that day.
 *
 *  @param timeZone the destination time zone. Should not be nil.
 *
 *  @return a NSDate object.
 */
- (NSDate *)beginningOfDayInTimeZone:(NSTimeZone *)timeZone;

/**
 *  Creates and returns an NSDate object set to beginning of that day.
 *
 *  @param dest the destination time zone. Should not be nil.
 *  @param src  the original time zone. Should not be nil.
 *
 *  @return a NSDate object.
 */
- (NSDate *)beginningOfDayInTimeZone:(NSTimeZone *)dest fromTimeZone:(NSTimeZone *)src;

/**
 *  Convert a date from a given time zone to another given time zone.
 *
 *  For example, converting 2014-10-22 16:00:00 +8000 in GMT+8 to GMT-7 should be 2014-12-22 16:00:00 -7000.
 *
 *  @param dest the destination time zone. Should not be nil.
 *  @param src  the source time zone. Should not be nil.
 *
 *  @return a NSDate object.
 */
- (NSDate *)dateTimeInTimeZone:(NSTimeZone *)dest fromTimeZone:(NSTimeZone *)src;
@end
