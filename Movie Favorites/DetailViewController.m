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
    
    UITapGestureRecognizer *imageGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped)];
    [self.movieImageView addGestureRecognizer:imageGestureRecognizer];
}

- (IBAction)favoritesButtonTapped:(id)sender {
    [self.manager toggleFavorite:self.movie completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadCollectionView" object:nil];
        
        [UIView animateWithDuration:0.7 animations:^{
            self.favoritesButton.alpha = 0;
        } completion:^(BOOL finished) {
            if (self.movie.isFavorite) {
                [self.favoritesButton setImage:[UIImage imageNamed:@"Star favorite"] forState:UIControlStateNormal];
            } else {
                [self.favoritesButton setImage:[UIImage imageNamed:@"Star"] forState:UIControlStateNormal];
            }
            
            [UIView animateWithDuration:0.7 animations:^{
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

-(void)imageViewTapped {
    if (self.overviewTextView.alpha == 0) {
        [UIView animateWithDuration:0.7 animations:^{
            self.overviewTextView.alpha = 0.9;
        }];
    } else {
        [UIView animateWithDuration:0.7 animations:^{
            self.overviewTextView.alpha = 0;
        }];
    }
}

@end
