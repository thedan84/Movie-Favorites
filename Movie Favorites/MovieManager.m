//
//  MovieManager.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "MovieManager.h"

//NSString *movieURLString = @"https:api.themoviedb.org/3/movie/popular?api_key=c3005ad5132be3f614b8de0fe58fbdf4";

//NSString const *imageString = @"https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg";

@implementation MovieManager

-(void)fetchMoviesWithPage:(NSInteger) page completion:(void(^)(RLMResults<Movie *> *movieArray)) completion {
    [NetworkManager requestEndpoint:@"https:api.themoviedb.org/3/movie/popular?api_key=c3005ad5132be3f614b8de0fe58fbdf4" completion:^(NSArray *JSONArray) {
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        for (NSDictionary *jsonDict in JSONArray) {
            [realm transactionWithBlock:^{
                [Movie createOrUpdateInRealm:realm withValue:jsonDict];
            }];
        }
        
        completion([Movie allObjects]);
    }];
}

-(void)saveMovieToFavorites:(Movie *)movie completion:(void (^)(void))completion {
    RLMRealm *realm = [RLMRealm defaultRealm];

    [realm beginWriteTransaction];
    
    movie.isFavorite = YES;
    
    [realm addOrUpdateObject:movie];
    [realm commitWriteTransaction];
    
    completion();
}

-(void)deleteMovieFromFavorites:(Movie *)movie completion:(void(^)(void))completion {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    movie.isFavorite = NO;
    
    [realm addOrUpdateObject:movie];
    [realm commitWriteTransaction];
    
    completion();
}

-(void)loadMoviesFromDisk: (void(^)(RLMResults<Movie *> *moviesArray))completion {
    RLMResults<Movie *> *movies = [Movie objectsWhere:@"isFavorite = YES"];
    completion(movies);
}

@end
