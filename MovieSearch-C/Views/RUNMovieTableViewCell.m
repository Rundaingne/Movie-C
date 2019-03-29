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
}

//I will need a setImage function, as well as a prepare for reuse. Maybe.

@end
