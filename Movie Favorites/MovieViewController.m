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
    
    UITabBar *tabbar = self.tabBarController.tabBar;
    
    if ([tabbar.selectedItem.title isEqualToString:@"Movies"]) {
        [self.manager fetchMoviesWithPage:1 completion:^(NSArray *movieArray) {
            self.movies = [[NSMutableArray alloc] initWithArray:movieArray];
            [self.collectionView reloadData];
        }];
    } else if ([tabbar.selectedItem.title isEqualToString:@"Favorites"]) {
        [self.manager loadMoviesFromDisk:^(RLMResults<Movie *> *moviesArray) {
            self.favorites = moviesArray;
            [self.collectionView reloadData];
        }];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = 0;
    
    UITabBar *tabbar = self.tabBarController.tabBar;
    
    if ([tabbar.selectedItem.title isEqualToString:@"Movies"]) {
        count = self.movies.count;
    } else if ([tabbar.selectedItem.title isEqualToString:@"Favorites"]) {
        count =  self.favorites.count;
    }
    NSLog(@"%li", (long)count);
    
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Movie *movie = [[Movie alloc] init];
    
    UITabBar *tabbar = self.tabBarController.tabBar;
    
    if ([tabbar.selectedItem.title isEqualToString:@"Movies"]) {
        movie = self.movies[indexPath.row];
    } else if ([tabbar.selectedItem.title isEqualToString:@"Favorites"]) {
        movie = self.favorites[indexPath.row];
    }

    [cell configureCellWithMovie:movie];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>



@end
