//
//  NSDate+iCalendarPropertyValue.h
//  iCal
//
//  Created by Hale Chan on 12/19/14.
//  Copyright (c) 2014 PapayaMobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (iCalendarPropertyValue)

- (NSString *)iCalendarDateString;

- (NSString *)iCalendarLocalTimeString;
- (NSString *)iCalendarUTCTimeString;

- (NSString *)iCalendarLocalDateTimeString;
- (NSString *)iCalendarUTCDateTimeString;

@end
