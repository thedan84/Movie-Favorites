//
//  MovieManager.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "MovieManager.h"

@implementation MovieManager

//Fetches the initial load of data of movies and also loads the next page(s)

-(void)fetchMoviesWithPage:(NSInteger) page completion:(void(^)(RLMResults<Movie *> *movieArray, NSError *error)) completion {
    [NetworkManager requestEndpoint:[NSString stringWithFormat:@"https:api.themoviedb.org/3/movie/popular?api_key=c3005ad5132be3f614b8de0fe58fbdf4&page=%li", (long)page] completion:^(NSArray *JSONArray, NSError *error) {
        
        if (error == nil) {
            RLMRealm *realm = [RLMRealm defaultRealm];
            
            for (NSDictionary *jsonDict in JSONArray) {
                [realm transactionWithBlock:^{
                    [Movie createOrUpdateInRealm:realm withValue:jsonDict];
                }];
            }
            
            completion([Movie allObjects], nil);
        } else {
            completion(nil, error);
        }
        
    }];
}

//Toggles the 'isFavorite' property of Movie

-(void)toggleFavorite:(Movie *)movie completion:(void(^)(void))completion {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    
    if (movie.isFavorite) {
        movie.isFavorite = NO;
    } else {
        movie.isFavorite = YES;
    }
    
    [realm addOrUpdateObject:movie];
    [realm commitWriteTransaction];
    
    completion();
}

//Loads the favorite movies from disk

-(void)loadFavoriteMoviesFromDisk: (void(^)(RLMResults<Movie *> *moviesArray))completion {
    RLMResults<Movie *> *movies = [Movie objectsWhere:@"isFavorite = YES"];
    completion(movies);
}

@end
