//
//  JEFCityAirQuality.h
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/25/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JEFWeather;
@class JEFPollution;

NS_ASSUME_NONNULL_BEGIN

@interface JEFCityAirQuality : NSObject

@property(nonatomic, copy, readonly) NSString *city;
@property(nonatomic, copy, readonly) NSString *state;
@property(nonatomic, copy, readonly) NSString *country;

@property(nonatomic, copy, readonly) JEFWeather *weather;
@property(nonatomic, copy, readonly) JEFPollution *pollution;

-(instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(JEFWeather *)weather pollution:(JEFPollution *)pollution;

@end

@interface JEFCityAirQuality (JSONConvertable)

-(instancetype)initWithDict:(NSDictionary *)dict;

@end


NS_ASSUME_NONNULL_END
