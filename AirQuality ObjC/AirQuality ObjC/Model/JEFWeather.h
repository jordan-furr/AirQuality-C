//
//  JEFWeather.h
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/25/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JEFWeather : NSObject

@property (nonatomic, readonly) NSInteger temperature;
@property (nonatomic, readonly) NSInteger humidity;
@property (nonatomic, readonly) NSInteger windSpeed;

- (instancetype)initWithTemp:(NSInteger)temperature humidity:(NSInteger)humidity windSpeed:(NSInteger)windSpeed;
@end

@interface JEFWeather (JSONConvertable)

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
