//
//  RUNMovie.m
//  MovieSearch-C
//
//  Created by Brooke Kumpunen on 3/29/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "RUNMovie.h"

@implementation RUNMovie

//Time to implement our initializers, and create that coding key.
//- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating overview:(NSString *)overview poster_path:(NSString *)poster_path
//{
//    self = [super init];
//    if(self) {
//        _title = title;
//        _rating = rating;
//        _overview = overview;
//        _poster_path = poster_path;
//    }
//    return self;
//}

//I may not need this initializer. I will remove it later if this is the case.

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self) {
        //Insert initializers. First, head down and create the codingKeys.
        _title = dictionary[@"title"];
        _rating = dictionary[[RUNMovie ratingKey]];
        _overview = dictionary[@"overview"];
        if (dictionary[@"poster_path"]){
            _poster_path = dictionary[@"poster_path"];
        }
    }
    return self;
}

+(NSString *)ratingKey
{
    return @"vote_average";
}

//All done. On to the network client.

@end
