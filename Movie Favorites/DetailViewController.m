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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addToFavoritesButtonTapped:(id)sender {
    [self.manager saveMovieToFavorites:self.movie completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadCollectionView" object:nil];
        [self dismissViewControllerAnimated:true completion:nil];
    }];
}

- (IBAction)removeFromFavoritesTapped:(id)sender {
    [self.manager deleteMovieFromFavorites:self.movie completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadCollectionView" object:nil];
        [self dismissViewControllerAnimated:true completion:nil];
    }];
}

- (IBAction)dismissButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


-(void)setupViewWithMovie:(Movie *)movie {
    NSString *url = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500%@", movie.poster_path];
    [self.movieImageView hnk_setImageFromURL:[NSURL URLWithString:url]];
    
    if (movie.isFavorite) {
        self.removeFromFavoritesButton.hidden = NO;
        self.addToFavoritesButton.hidden = YES;
    } else {
        self.removeFromFavoritesButton.hidden = YES;
        self.addToFavoritesButton.hidden = NO;
    }
}


@end
