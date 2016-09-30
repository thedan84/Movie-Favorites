//
//  ImageManager.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "ImageManager.h"
#import <SAMCache/SAMCache.h>


//NSString const *imageString = @"https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg";


@implementation ImageManager

-(void)imageForPosterPath:(NSString *)posterPath completion:(void(^)(UIImage *image))completion {
    
    if (posterPath == nil) {
        NSLog(@"Missing photo dictionary");
        return;
    }
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://image.tmdb.org/t/p/original/%@?api_key=c3005ad5132be3f614b8de0fe58fbdf4", posterPath];
    
    NSString *key = urlString;
    UIImage *cachedImage = [[SAMCache sharedCache] imageForKey:key];
    
    if (cachedImage) {
        completion(cachedImage);
        return;
    }
    
    [NetworkManager requestEndpoint:urlString completion:^(NSArray *JSONArray) {
        NSLog(@"JSONArray: %@", JSONArray);
    }];
    
    completion(nil);
    
    
    
    
//    if (photo == nil || size == nil || completion == nil) {
//        NSLog(@"Missing argument for imageForPhoto");
//        return;
//    }
//    
//    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@%@", [photo valueForKeyPath:@"response.venue.bestPhoto.prefix"], size, [photo valueForKeyPath:@"response.venue.bestPhoto.suffix"]];
//    
//    NSString *key = urlString;
//    UIImage *cachedPhoto = [[SAMCache sharedCache] imageForKey:key];
//    
//    if (cachedPhoto) {
//        completion(cachedPhoto);
//        return;
//    }
//    
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
//        
//        UIImage *image = [[UIImage alloc] initWithData:data];
//        [[SAMCache sharedCache] setImage:image forKey:key];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            completion(image);
//        });
//        
//    }];
//    
//    [task resume];
}

@end
