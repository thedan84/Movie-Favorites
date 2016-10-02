//
//  MovieCell.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "Haneke.h"

@interface MovieCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UIImageView *favoritesImageView;

-(void)configureCellWithMovie:(Movie *)movie;

@end
