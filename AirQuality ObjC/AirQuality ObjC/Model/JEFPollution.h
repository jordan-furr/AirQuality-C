//
//  JEFPollution.h
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/25/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JEFPollution : NSObject

@property (nonatomic, readonly) NSInteger airQualityIndex;

- (instancetype)initWithIndex:(NSInteger)aqi;
@end

@interface JEFPollution (JSONConvertable)

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
NS_ASSUME_NONNULL_END
