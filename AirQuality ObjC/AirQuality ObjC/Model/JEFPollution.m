//
//  JEFPollution.m
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/25/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "JEFPollution.h"

@implementation JEFPollution

-(instancetype)initWithIndex:(NSInteger)aqi
{
    self = [super init];
    if (self){
        _airQualityIndex = aqi;
    }
    return self;
}
@end

@implementation JEFPollution (JSONConvertable)
-(instancetype)initWithDict:(NSDictionary *)dict
{
    NSInteger api = [dict[@"aqius"] integerValue];

    return [self initWithIndex:api];
}

@end
