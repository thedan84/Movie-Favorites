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

-(void)fetchMoviesWithPage:(NSInteger) page completion:(void(^)(NSArray *movieArray)) completion {
    [NetworkManager requestEndpoint:@"https:api.themoviedb.org/3/movie/popular?api_key=c3005ad5132be3f614b8de0fe58fbdf4" completion:^(NSArray *JSONArray) {
        
        NSMutableArray *moviesArray = [NSMutableArray new];
        
        for (NSDictionary *jsonDict in JSONArray) {
            Movie *movie = [[Movie alloc] initWithDictionary:jsonDict];
            [moviesArray addObject:movie];
        }
        
        completion(moviesArray);
    }];
}

@end
