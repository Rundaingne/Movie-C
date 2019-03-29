//
//  RUNMovieTableViewCell.m
//  MovieSearch-C
//
//  Created by Brooke Kumpunen on 3/29/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import "RUNMovieTableViewCell.h"

@implementation RUNMovieTableViewCell

//In place of a didSet, I will need to create a private "setMovie" function. If I get to the poster part(pretty sure I will), you'll have to add a setImage setter, and then call that in the setMovie and update it on the main thread.
-(void)setMovie:(RUNMovie *)movie
{
    _movie = movie;
    self.movieTitleLabel.text = movie.title;
    NSString *ratingString = [[movie rating] stringValue];
    self.movieRatingLabel.text = ratingString;
    self.movieOverviewTextView.text = movie.overview;
    //Add stuff here for the image.
    [self setMoviePoster:movie];
}

-(void)setMoviePoster:(RUNMovie *)movie
{
    if (movie.poster_path){
        [RUNMovieClient fetchMovieImageWithImagePath:movie completion:^(NSData * _Nullable imagePath) {
            UIImage *movieImage = [UIImage imageWithData:imagePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.moviePosterImageView.image = movieImage;
            });
        }];
    }else {
        NSLog(@"NO IMAGE WOOT WOOT");
    }
}


//I will need a setImage function. As well as a prepare for reuse. Maybe.

@end
