//
//  MovieManager.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import <Realm/Realm.h>

@interface MovieManager : NSObject

-(void)fetchMoviesWithPage:(NSInteger) page completion:(void(^)(RLMResults<Movie *> *movieArray, NSError *error)) completion;
-(void)toggleFavorite:(Movie *)movie completion:(void(^)(void))completion;
-(void)loadFavoriteMoviesFromDisk: (void(^)(RLMResults<Movie *> *moviesArray))completion;

@end
