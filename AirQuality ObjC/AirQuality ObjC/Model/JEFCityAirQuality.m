//
//  JEFCityAirQuality.m
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/25/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "JEFCityAirQuality.h"
#import "JEFWeather.h"
#import "JEFPollution.h"

@implementation JEFCityAirQuality

-(instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(JEFWeather *)weather pollution:(JEFPollution *)pollution
{
    self = [super init];
    
    if (self){
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
    NSString *city = dict[@"city"];
    NSString *state = dict[@"state"];
    NSString *country = dict[@"country"];
    NSDictionary *current = dict[@"current"];
    JEFWeather *weather = [[JEFWeather alloc] initWithDict:current[@"weather"]];
    JEFPollution *pollu = [[JEFPollution alloc] initWithDict:current[@"pollution"]];
    
    return [self initWithCity:city state:state country:country weather:weather pollution:pollu];
}

@end
