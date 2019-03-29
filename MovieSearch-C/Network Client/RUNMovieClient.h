//
//  RUNMovieClient.h
//  MovieSearch-C
//
//  Created by Brooke Kumpunen on 3/29/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RUNMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface RUNMovieClient : NSObject

//I'll need my function "stubs" here, as it were. What functions do I need? Well I need a search movies function. I will also need a fetchImageData function, but I will put that in the cell itself.
+(void)searchMoviesWithSearchTerm:(NSString *)searchTerm completion:(void(^)(NSArray<RUNMovie *> *movies))completion;

+ (void)fetchMovieImageWithImagePath:(RUNMovie *)movie completion:(void (^)(NSData *_Nullable imageData))completion;
//That's good for this.

@end

NS_ASSUME_NONNULL_END
