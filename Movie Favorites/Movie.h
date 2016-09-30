//
//  Movie.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *overview;
@property (nonatomic) NSURL *imageURL;
@property (nonatomic) NSNumber *identifier;

-(id)initWithDictionary:(NSDictionary *)JSONDict;

@end
