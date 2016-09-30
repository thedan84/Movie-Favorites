//
//  MovieManager.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@interface MovieManager : NSObject

-(void)fetchMoviesWithPage:(NSInteger) page completion:(void(^)(NSArray *movieArray)) completion;

@end
