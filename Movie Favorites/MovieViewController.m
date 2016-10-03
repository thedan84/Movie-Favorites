//
//  MovieViewController.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "MovieViewController.h"
#import <SVPullToRefresh/SVPullToRefresh.h>

@implementation MovieViewController

static NSString * const reuseIdentifier = @"movieCell";

#pragma mark <View lifecycle>

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[MovieManager alloc] init];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.page = 1;
    
#pragma mark <Fetch initial data>
    [self.manager fetchMoviesWithPage:self.page completion:^(RLMResults<Movie *> *movieArray, NSError *error) {
        if (error == nil) {
            self.movies = movieArray;
            self.page += 1;
            [self reloadCollectionView];
        } else {
            [self showAlertWithTitle:@"There seems to be a problem" andMessage:error.localizedDescription];
        }
        
    }];
    
#pragma mark <Infinite scrolling>
    __weak typeof(self) weakSelf = self;
    [self.collectionView addInfiniteScrollingWithActionHandler:^{
        __strong typeof(self) strongSelf = weakSelf;
        
        [strongSelf.manager fetchMoviesWithPage:strongSelf.page completion:^(RLMResults<Movie *> *movieArray, NSError *error) {
            if (error == nil) {
                strongSelf.movies = movieArray;
                strongSelf.page += 1;
                [strongSelf.collectionView.infiniteScrollingView stopAnimating];
                [strongSelf reloadCollectionView];
            } else {
                [strongSelf showAlertWithTitle:@"There seems to be a problem" andMessage:error.localizedDescription];
            }
        }];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCollectionView) name:@"ReloadCollectionView" object:nil];
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
    [self.navigationController pushViewController:detailVC animated:true];
}

#pragma mark <UIAlertController>
-(void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:true completion:nil];
}

#pragma mark <Helper>

-(void)reloadCollectionView {
    [self.collectionView reloadData];
}

@end
