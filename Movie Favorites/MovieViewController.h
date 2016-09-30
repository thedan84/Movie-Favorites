//
//  MovieViewController.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCell.h"
#import "MovieManager.h"

@interface MovieViewController : UICollectionViewController

@property (nonatomic) MovieManager *manager;
@property (nonatomic) NSMutableArray *movies;

@end
