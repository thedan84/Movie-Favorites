//
//  MovieCell.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "MovieCell.h"
#import "Haneke.h"

@implementation MovieCell

-(void)prepareForReuse {
    [self.movieImageView hnk_cancelSetImage];
    self.movieImageView.image = nil;
}

-(void)configureCellWithMovie:(Movie *)movie {
    [self.movieImageView hnk_setImageFromURL:movie.imageURL];
}

@end
