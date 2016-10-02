//
//  NetworkManager.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface NetworkManager : NSObject

+(void)requestEndpoint:(NSString *)endpoint completion:(void(^)(NSArray *JSONArray, NSError *error))completion;

@end
