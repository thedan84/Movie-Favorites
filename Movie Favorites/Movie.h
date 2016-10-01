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

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *overview;
@property (nonatomic) NSString *imageURLString;
@property (nonatomic) NSNumber<RLMInt> *identifier;

-(id)initWithDictionary:(NSDictionary *)JSONDict;

@end
