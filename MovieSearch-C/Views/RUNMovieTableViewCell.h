//
//  RUNMovieTableViewCell.h
//  MovieSearch-C
//
//  Created by Brooke Kumpunen on 3/29/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RUNMovie.h"
#import "RUNMovieClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface RUNMovieTableViewCell : UITableViewCell

//Let's add IBOutlets here, and a landing pad for my movie to display.
@property (weak, nonatomic) IBOutlet UIImageView *moviePosterImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieRatingLabel;
@property (weak, nonatomic) IBOutlet UITextView *movieOverviewTextView;

@property (nonatomic, readwrite) RUNMovie *movie;

@end

NS_ASSUME_NONNULL_END
