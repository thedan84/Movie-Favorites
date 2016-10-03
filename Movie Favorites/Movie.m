//
//  Movie.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "Movie.h"

@implementation Movie

//Movie doesn't need an init method because Realm handles initialization of the class for us. Updating the Database is done via the primary key, and each instance's 'isFavorite' property is set to 'NO' during saving to disk.

+ (NSDictionary *)defaultPropertyValues {
    return @{@"isFavorite" : @NO};
}

+ (NSString *)primaryKey {
    return @"id";
}

@end
