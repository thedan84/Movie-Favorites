//
//  ImageManager.h
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NetworkManager.h"

@interface ImageManager : NSObject

-(void)imageForPosterPath:(NSString *)posterPath completion:(void(^)(UIImage *image))completion;

@end
