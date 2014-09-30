//
//  NSTimeZone+iCal.h
//  iCal
//
//  Created by Hale Chan on 14-9-30.
//  Copyright (c) 2014年 Papaya Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ical.h"

@interface NSTimeZone (iCal)

/**
 *  Returns the default icaltimezone for this application
 *
 *  @return the default icaltimezone for this application
 */
+ (icaltimezone *)defaultICalTimeZone;

/**
 *  sets the default time zone for the current application to a given time zone.
 *
 *  There can be only one default time zone, so by setting a new default time zone, you lose the previous one.
 *
 *  This method does not change [NSTimeZone defaultTimeZone].
 *
 *  @notice This method is thread-safe and can be called at any thread.
 *
 *  @param aTimeZone The new default time zone for the current application.
 */
+ (void)setDefaultICalTimeZone:(icaltimezone *)aTimeZone;

/**
 *  Returns a time zone object set to the given place.
 *
 *  @param aTimeZone a icaltimezone object stores time zone information.
 *
 *  @return a time zone object set to the given place.
 */
+ (instancetype)timeZoneWithICalTimeZone:(icaltimezone *)aTimeZone;

/**
 *  Convert the receiver to a icaltimezone object.
 *
 *  @return a icaltimezone object that has same time zone as the receiver.
 */
- (icaltimezone *)iCalTimeZone;

@end
