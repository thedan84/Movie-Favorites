//
//  FavoritesViewController.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 01-10-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "MovieCell.h"
#import "MovieManager.h"
#import "DetailViewController.h"

@interface FavoritesViewController : UICollectionViewController

@property (nonatomic) MovieManager *manager;
@property (nonatomic) RLMResults<Movie *> *favorites;

@end
