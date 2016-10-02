//
//  MovieViewController.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "MovieViewController.h"

@implementation MovieViewController

static NSString * const reuseIdentifier = @"movieCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[MovieManager alloc] init];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.manager fetchMoviesWithPage:1 completion:^(RLMResults<Movie *> *movieArray) {
        self.movies = movieArray;

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    NSLog(@"%@", [config fileURL]);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Movie *movie = self.movies[indexPath.row];
    [cell configureCellWithMovie:movie];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    Movie *movie = self.movies[indexPath.row];
    detailVC.movie = movie;
    [self presentViewController:detailVC animated:true completion:nil];
}

@end
