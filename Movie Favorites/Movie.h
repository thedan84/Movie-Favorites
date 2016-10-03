//
//  Movie.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Movie : RLMObject

@property NSString *title;
@property NSString *overview;
@property NSString *poster_path;
@property NSInteger id;
@property BOOL isFavorite;

@end
