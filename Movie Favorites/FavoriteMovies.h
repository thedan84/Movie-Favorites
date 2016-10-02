//
//  FavoriteMovies.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 02-10-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <Realm/Realm.h>
#import "Movie.h"

@interface FavoriteMovies : RLMObject

@property RLMArray<Movie *><Movie> *movies;

@end
