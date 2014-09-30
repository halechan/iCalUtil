//
//  NSTimeZone+iCal.m
//  iCal
//
//  Created by Hale Chan on 14-9-30.
//  Copyright (c) 2014年 Papaya Mobile Inc. All rights reserved.
//

#import "NSTimeZone+iCal.h"

@implementation NSTimeZone (iCal)

static icaltimezone * _defaultICalTimeZone = NULL;

+ (icaltimezone *)defaultICalTimeZone
{
    if (!_defaultICalTimeZone) {
        [self setDefaultICalTimeZone:[[NSTimeZone defaultTimeZone] iCalTimeZone]];
    }
    return _defaultICalTimeZone;
}

+ (void)setDefaultICalTimeZone:(icaltimezone *)aTimeZone
{
    @synchronized (self) {
        if (aTimeZone) {
            _defaultICalTimeZone = aTimeZone;
        }
    }
}

+ (instancetype)timeZoneWithICalTimeZone:(icaltimezone *)timezone
{
    const char *location = icaltimezone_get_location(timezone);
    NSString *name = location ? @(location) : @"UTC";
    return [NSTimeZone timeZoneWithAbbreviation:name];
}

- (icaltimezone *)iCalTimeZone
{
    return icaltimezone_get_builtin_timezone([self.name UTF8String]);
}
@end
