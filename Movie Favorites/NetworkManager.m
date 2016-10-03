//
//  NetworkManager.m
//  Movie Favorites
//
//  Created by Dennis Parussini on 29-09-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

#pragma mark <Request endpoint method>

+(void)requestEndpoint:(NSString *)urlEndpointString completion:(void(^)(NSArray *JSONArray, NSError *error))completion {
    NSURL *url = [NSURL URLWithString:urlEndpointString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        
        if (data != nil) {
            NSDictionary *JSONDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSArray *JSONArray = [JSONDict valueForKey:@"results"];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                completion(JSONArray, nil);
            }];
        } else {
            completion(nil, error);
        }
        
    }];
    
    [task resume];
}

@end
