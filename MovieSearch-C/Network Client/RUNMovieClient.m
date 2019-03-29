//
//  RUNMovieClient.m
//  MovieSearch-C
//
//  Created by Brooke Kumpunen on 3/29/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "RUNMovieClient.h"

@implementation RUNMovieClient

+(NSURL *)baseURL
{
    return [[NSURL alloc] initWithString:@"https://api.themoviedb.org/3/search/movie"];
}

+ (void)searchMoviesWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<RUNMovie *> * _Nonnull))completion
{
    NSURL *url = [self baseURL];
    //Let's build our url. This one will require query items and components.
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:true];
//    let apiKeyQueryItem = URLQueryItem(name: "api_key", value: "1dbae9c4649709053b9777d147a48d9f")
//    let querySearchItem = URLQueryItem(name: "query", value: searchTerm)
//    urlComponents?.queryItems = [apiKeyQueryItem, querySearchItem]
    NSURLQueryItem *apiKeyQueryItem = [[NSURLQueryItem alloc] initWithName:@"api_key" value:@"1dbae9c4649709053b9777d147a48d9f"];
    NSURLQueryItem *querySearchTerm = [[NSURLQueryItem alloc] initWithName:@"query" value:searchTerm];
    components.queryItems = [[NSArray alloc] initWithObjects:apiKeyQueryItem,querySearchTerm, nil];
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    //Just in case, let's do it how we did the original by making a request.
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:finalURL];

    //Got the URL. Sweet. Now let's send it on up to the api.
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(@[]);
            return;
        }
        if (!data) {
            NSLog(@"No data available");
            completion(@[]);
            return;
        }
        //If we get here, we've got data in the form of our topLevelJSONDictionary. Cool beans.
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        //We want to tap one level down from here. We need the results array.
        NSArray *movieDictionaries = jsonDictionary[@"results"];
        //We also need a mutable array to store our movies in to return in the completion.
        NSMutableArray *movies = [NSMutableArray new];
        for (NSDictionary *movieDictionary in movieDictionaries) {
            //Each time we look at a movie dictionary, let's create a movie from the dictionary. And then store it in our movies array.
            RUNMovie *movie = [[RUNMovie alloc] initWithDictionary:movieDictionary];
            [movies addObject:movie];
        }
        completion(movies);
    }] resume];
}

//EAT IT. DONE WITH YOU, YA DANG FETCH FUNCTION.

//I will add a fetch images function later. Let's get the rest of the app working first.

@end