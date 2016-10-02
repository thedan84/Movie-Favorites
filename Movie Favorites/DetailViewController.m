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
    [self.manager toggleFavorite:self.movie completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadCollectionView" object:nil];
        
        [UIView animateWithDuration:1 animations:^{
            self.favoritesButton.alpha = 0;
        } completion:^(BOOL finished) {
            if (self.movie.isFavorite) {
                [self.favoritesButton setImage:[UIImage imageNamed:@"Star favorite"] forState:UIControlStateNormal];
            } else {
                [self.favoritesButton setImage:[UIImage imageNamed:@"Star"] forState:UIControlStateNormal];
            }
            
            [UIView animateWithDuration:1 animations:^{
                self.favoritesButton.alpha = 1;
            }];
        }];
        
    }];
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
