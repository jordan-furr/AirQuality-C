//
//  JEFWeather.m
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/25/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "JEFWeather.h"

@implementation JEFWeather

-(instancetype)initWithTemp:(NSInteger)temperature humidity:(NSInteger)humidity windSpeed:(NSInteger)windSpeed
{
    self = [super init];
    if (self) {
        _temperature = temperature;
        _humidity = humidity;
        _windSpeed = windSpeed;
    }
    return self;
}
@end


 @implementation JEFWeather(JSONConvertable)
 -(instancetype)initWithDict:(NSDictionary *)dict
 {
     NSInteger temp = [dict[@"tp"] integerValue];
     NSInteger humidity = [dict[@"hu"] integerValue];
     NSInteger windSpd = [dict[@"wd"] integerValue];

     return [self initWithTemp:temp humidity:humidity windSpeed:windSpd];
 }

 @end
