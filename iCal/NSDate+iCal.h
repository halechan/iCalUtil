//
//  NSDate+iCal.h
//  iCal
//
//  Created by Hale Chan on 14-9-30.
//  Copyright (c) 2014年 PapayaMobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ical.h"

@interface NSDate (iCal)

/**
 *  Creates and returns an NSDate object set to a given time represented by a icaltimetype struct.
 *
 *  @param time a icaltimetype struct that stores some time information.
 *
 *  @return an NSDate object set to a given time represented by a icaltimetype struct.
 */
+ (instancetype)dateWithICalTime:(icaltimetype)time;

/**
 *  Creates and returns an icaltimetype struct set to the same time as the receiver, and set timezone to UTC.
 *
 *  @notice never call this method directly, instead, use iCalTimeFromNSDate() helper method to perform a nil-receiver check for security reason.
 *
 *  @return an icaltimetype struct set to the same time as the receiver.
 */
- (icaltimetype)iCalTime;

/**
 *  Creates and returns an icaltimetype struct set to the same time as the receiver, and set timezone to the given timezone.
 *
 *  @notice never call this method directly, instead, use iCalTimeFromNSDateAndNSTimeZone() helper method to perform a nil-receiver check for security reason.
 *
 *  @param timeZone a NSTimeZone object stores timezone information, if pass nil, the UTC timezone will be used.
 *
 *  @return returns an icaltimetype struct set to the same time as the receiver, and set timezone to the given timezone.
 */
- (icaltimetype)iCalTimeWithTimeZone:(NSTimeZone *)timeZone;

@end

#define iCalYes 1
#define iCalNo  0

static inline icaltimetype iCalTimeFromNSDate(NSDate *date)
{
    return date ? [date iCalTime] : icaltime_null_time();
}

static inline icaltimetype iCalTimeFromNSDateAndNSTimeZone(NSDate *date, NSTimeZone *timezone)
{
    return date ? [date iCalTimeWithTimeZone:timezone] : icaltime_null_time();
}

static inline icaltimetype iCalTimeSetToDate(icaltimetype time)
{
    icaltimetype t = time;
    t.is_date = iCalYes;
    t.hour = 0;
    t.minute = 0;
    t.second = 0;
    
    return t;
}

static inline void iCalTimeRefSetToDate(icaltimetype *time)
{
    time->is_date = iCalYes;
    time->hour = 0;
    time->minute = 0;
    time->second = 0;
}


