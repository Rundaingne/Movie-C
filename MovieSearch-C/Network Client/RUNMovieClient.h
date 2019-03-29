//
//  RUNMovieClient.h
//  MovieSearch-C
//
//  Created by Brooke Kumpunen on 3/29/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RUNMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface RUNMovieClient : NSObject

//I'll need my function "stubs" here, as it were. What functions do I need? Well I need a search movies function. I might want a search movies with search term function as well. Hmmmm...
+(void)searchMoviesWithSearchTerm:(NSString *)searchTerm completion:(void(^)(NSArray<RUNMovie *> *movies))completion;

//That's good for this.

@end

NS_ASSUME_NONNULL_END
