//
//  FavoritesViewController.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 01-10-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "FavoritesViewController.h"

@implementation FavoritesViewController

static NSString * const reuseIdentifier = @"movieCell";

#pragma mark <View lifecycle>

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.manager = [[MovieManager alloc] init];
    [self.manager loadFavoriteMoviesFromDisk:^(RLMResults<Movie *> *moviesArray) {
        self.favorites = moviesArray;
        [self reloadColletionView];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadColletionView) name:@"ReloadCollectionView" object:nil];
}

-(void)reloadColletionView {
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.favorites.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Movie *movie = self.favorites[indexPath.row];
    [cell configureCellWithMovie:movie];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    Movie *movie = self.favorites[indexPath.row];
    detailVC.movie = movie;
    [self.navigationController pushViewController:detailVC animated:true];
}

@end
