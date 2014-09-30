//
//  NSDate+iCal.m
//  iCal
//
//  Created by Hale Chan on 14-9-30.
//  Copyright (c) 2014年 Papaya Mobile Inc. All rights reserved.
//

#import "NSDate+iCal.h"
#import "NSTimeZone+iCal.h"

@implementation NSDate (iCal)
+ (instancetype)dateWithICalTime:(icaltimetype)time
{
    if (icaltime_is_null_time(time)) {
        return nil;
    }
    
    const icaltimezone *zone = time.zone ?: icaltimezone_get_utc_timezone();
    time_t t = icaltime_as_timet_with_zone(time, zone);
    
    return [NSDate dateWithTimeIntervalSince1970:t];
}

- (icaltimetype)iCalTime
{
    return [self iCalTimeWithTimeZone:nil];
}

- (icaltimetype)iCalTimeWithTimeZone:(NSTimeZone *)timeZone
{
    icaltimezone *utc = icaltimezone_get_utc_timezone();
    time_t tm = [self timeIntervalSince1970];
    icaltimetype tt = icaltime_from_timet_with_zone(tm, 0, utc);
    tt.zone = utc;
    
    icaltimezone *tz = [timeZone iCalTimeZone];
    if (tz && tz != utc) {
        tt = icaltime_convert_to_zone(tt, tz);
    }
    
    return tt;
}

@end
