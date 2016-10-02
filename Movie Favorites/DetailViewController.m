//
//  DetailViewController.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 01-10-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[MovieManager alloc] init];
    [self setupViewWithMovie:self.movie];
}

- (IBAction)favoritesButtonTapped:(id)sender {
    if (self.movie.isFavorite) {
        [self.manager deleteMovieFromFavorites:self.movie completion:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadCollectionView" object:nil];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.favoritesButton setImage:[UIImage imageNamed:@"Star"] forState:UIControlStateNormal];
            }];
        }];
    } else {
        [self.manager saveMovieToFavorites:self.movie completion:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadCollectionView" object:nil];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.favoritesButton setImage:[UIImage imageNamed:@"Star favorite"] forState:UIControlStateNormal];
            }];
        }];
    }
}

-(void)setupViewWithMovie:(Movie *)movie {
    NSString *url = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", movie.poster_path];
    [self.movieImageView hnk_setImageFromURL:[NSURL URLWithString:url]];
    self.overviewTextView.text = movie.overview;
    
    if (movie.isFavorite) {
        [self.favoritesButton setImage:[UIImage imageNamed:@"Star favorite"] forState:UIControlStateNormal];
    } else {
        [self.favoritesButton setImage:[UIImage imageNamed:@"Star"] forState:UIControlStateNormal];
    }
}

@end
