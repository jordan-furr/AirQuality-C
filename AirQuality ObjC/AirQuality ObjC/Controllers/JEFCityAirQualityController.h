//
//  JEFCityAirQualityController.h
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/25/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JEFPost;
@class JEFCityAirQuality;


NS_ASSUME_NONNULL_BEGIN

@interface JEFCityAirQualityController : NSObject

+(void)fetchSupportedCountries:(void(^)(NSArray<NSString *> *))completion;
+(void)fetchSupportedStatesInCountry:(NSString *) country completion:(void(^)(NSArray<NSString *> *))states;
+(void)fetchSupportedCitiesInState:(NSString *) state country:(NSString *) country completion:(void(^)(NSArray<NSString *> *))cities;
+(void)fetchCity:(NSString *)city state:(NSString *) state country:(NSString *) country completion:(void(^)(JEFCityAirQuality *))completion;

@end

NS_ASSUME_NONNULL_END
