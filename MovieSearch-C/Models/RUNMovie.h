//
//  RUNMovie.h
//  MovieSearch-C
//
//  Created by Brooke Kumpunen on 3/29/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RUNMovie : NSObject

//Alright...our movie has what kind of properties? Let's take a look at the API to see. I can also get the key names that way. I will just use the api key I had from the other movie project, as well as the baseURL there and such.
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, copy, readonly) NSString *overview;

//I need an initializer, or probably two. But I also need a codingKey for the rating, corresponding to @"vote_average". Looks like that will be done in the .m file though. Let's do the initializer then. Don't forget that it's of instancetype, not void.

//-(instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating overview:(NSString *)overview;

//Also of note, is that this API json structure looks identical to the swapi. I can initialize a dictionary very similarly.

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;



@end

NS_ASSUME_NONNULL_END
