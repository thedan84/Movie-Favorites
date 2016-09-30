//
//  Movie.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(id)initWithDictionary:(NSDictionary *)JSONDict {
    self.title = [JSONDict valueForKey:@"title"];
    self.overview = [JSONDict valueForKey:@"overview"];
    self.posterPath = [JSONDict valueForKey:@"poster_path"];
    return self;
}

@end
