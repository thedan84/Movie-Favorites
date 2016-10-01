//
//  Movie.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "Movie.h"

@implementation Movie

//-(id)initWithDictionary:(NSDictionary *)JSONDict {
//    self.identifier = [[JSONDict valueForKey:@"id"]intValue];
//    self.title = [JSONDict valueForKey:@"title"];
//    self.overview = [JSONDict valueForKey:@"overview"];
//    NSString *posterPath = [JSONDict valueForKey:@"poster_path"];
//    NSString *urlString = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500%@", posterPath];
//    self.imageURLString = urlString;
//    self.isFavorite = false;
//    
//    return self;
//}

+ (NSDictionary *)defaultPropertyValues {
    return @{@"isFavorite" : @NO};
}

+ (NSString *)primaryKey {
    return @"id";
}

@end
