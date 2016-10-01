//
//  MovieCell.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

-(void)prepareForReuse {
    [self.movieImageView hnk_cancelSetImage];
    self.movieImageView.image = nil;
}

-(void)configureCellWithMovie:(Movie *)movie {
    NSString *url = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500%@", movie.poster_path];
    [self.movieImageView hnk_setImageFromURL:[NSURL URLWithString:url]];
}

@end
