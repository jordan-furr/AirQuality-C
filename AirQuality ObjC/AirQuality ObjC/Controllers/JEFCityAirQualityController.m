//
//  JEFCityAirQualityController.m
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/25/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

#import "JEFCityAirQualityController.h"
#import "JEFCityAirQuality.h"

static NSString * const baseAQURL = @"https://api.airvisual.com/";
static NSString * const version = @"v2";
static NSString * const countryComponent = @"countries";
static NSString * const stateComponent = @"states";
static NSString * const cityComponent = @"cities";
static NSString * const cityDetail = @"city";
static NSString * const apiKey = @"4b80916d-b367-4aba-a088-6226731c8b54";
static NSString * const apiQuery = @"key";

@implementation JEFCityAirQualityController

+(void)fetchSupportedCountries:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseAQURL];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:version];
    NSURL *countryURL = [versionURL URLByAppendingPathComponent:countryComponent];
     
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:countryURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem * queryitem = [[NSURLQueryItem alloc] initWithName:apiQuery value:apiKey];
    components.queryItems =@[queryitem];
    NSURL *finalURL = components.URL;
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Error fetching pokemon from searchterm: %@", error);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"Error fethcing pokemon data from search term: %@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelJson = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        NSDictionary *dataDict = topLevelJson[@"data"];
        NSMutableArray *arrayOfCountries = [NSMutableArray new];
        
        for (NSDictionary *current in dataDict)
        {
            NSString *countryname = current[@"country"];
            [arrayOfCountries addObject:countryname];
        }
        completion(arrayOfCountries);
        //check !json[NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
    }]resume];
}

+(void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^)(NSArray<NSString *> *))states
{
    NSURL *baseURL = [NSURL URLWithString:baseAQURL];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:version];
    NSURL *stateURL = [versionURL URLByAppendingPathComponent:stateComponent];
     
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:stateURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem * queryitem = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem * queryitem1 = [[NSURLQueryItem alloc] initWithName:apiQuery value:apiKey];
    components.queryItems =@[queryitem, queryitem1];
    NSURL *finalURL = components.URL;
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Error fetching pokemon from searchterm: %@", error);
            states(nil);
            return;
        }
        
        if (!data){
            NSLog(@"Error fethcing pokemon data from search term: %@", error);
            states(nil);
            return;
        }
        
        NSDictionary *topLevelJson = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        NSArray<NSDictionary *>  *dataArray = topLevelJson[@"data"];
        NSMutableArray *arrayofStates = [NSMutableArray new];
        
        for (NSDictionary *current in dataArray)
        {
            NSString *stateName = current[@"state"];
            [arrayofStates addObject:stateName];
        }
        states(arrayofStates);
    
        //check !json[NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
    }]resume];
}

+(void)fetchSupportedCitiesInState:(NSString *)state country:(NSString *)country completion:(void (^)(NSArray<NSString *> *))cities
{
    NSURL *baseURL = [NSURL URLWithString:baseAQURL];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:version];
    NSURL *cityURL = [versionURL URLByAppendingPathComponent:cityComponent];
     
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:cityURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem * queryitem = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem * queryitem1 = [[NSURLQueryItem alloc] initWithName:@"state" value:state];
    NSURLQueryItem * queryitem2 = [[NSURLQueryItem alloc] initWithName:apiQuery value:apiKey];
    components.queryItems =@[queryitem, queryitem1, queryitem2];
    NSURL *finalURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Error fetching pokemon from searchterm: %@", error);
            cities(nil);
            return;
        }
        
        if (!data){
            NSLog(@"Error fethcing pokemon data from search term: %@", error);
            cities(nil);
            return;
        }
        
        NSDictionary *topLevelJson = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        NSArray<NSDictionary *>  *dataArray = topLevelJson[@"data"];
        NSMutableArray *arrayofCities = [NSMutableArray new];
        
        for (NSDictionary *current in dataArray)
        {
            NSString *cityName = current[@"city"];
            [arrayofCities addObject:cityName];
        }
        cities(arrayofCities);
    
        //check !json[NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
    }]resume];
    
}

+(void)fetchCity:(NSString *)city state:(NSString *)state country:(NSString *)country completion:(void (^)(JEFCityAirQuality *))completion
{
    
    NSURL *baseURL = [NSURL URLWithString:baseAQURL];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:version];
    NSURL *cityURL = [versionURL URLByAppendingPathComponent:cityDetail];
     
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:cityURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem * queryitem = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem * queryitem1 = [[NSURLQueryItem alloc] initWithName:@"state" value:state];
    NSURLQueryItem * queryitem2 = [[NSURLQueryItem alloc] initWithName:@"city" value:city];
    NSURLQueryItem * queryitem3 = [[NSURLQueryItem alloc] initWithName:apiQuery value:apiKey];
    components.queryItems =@[queryitem, queryitem1, queryitem2, queryitem3];
    NSURL *finalURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Error fetching pokemon from searchterm: %@", error);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"Error fethcing pokemon data from search term: %@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelJson = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        NSDictionary *datadict = topLevelJson[@"data"];
        
        JEFCityAirQuality *finalObj = [[JEFCityAirQuality alloc] initWithDict:datadict];
        completion(finalObj);
        //check !json[NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
    }]resume];
    
}

@end
