//
//  DetailViewController.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 01-10-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import <Haneke/Haneke.h>
#import "MovieManager.h"
#import "FavoritesViewController.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UIButton *addToFavoritesButton;
@property (weak, nonatomic) IBOutlet UIButton *removeFromFavoritesButton;

@property (nonatomic) Movie *movie;
@property (nonatomic) MovieManager *manager;

@end
