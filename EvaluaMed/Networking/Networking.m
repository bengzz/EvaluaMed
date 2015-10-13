//
//  Networking.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/12/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "Networking.h"

@implementation Networking

- (void)authenticateWithUserEmail:(NSString *)pUserEmail withUserPassword:(NSString *)pUserPassword completion:(void (^)(BOOL success))completionBlock{
//    NSString *loginURL = @"https://mydomain/login";
//    NSDictionary *parameters = @{@"format": @"json"};
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:pUserEmail password:pUserPassword];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    AFHTTPRequestOperation *operation = [manager GET:loginURL parameters:parameters
//        success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (completionBlock) { completionBlock(YES);
//                            }
//        NSLog(@"Success");
//        }
//        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (completionBlock) { completionBlock(NO);
//                            }
//        NSLog(@"Failure");
//        }];
//    [operation start];
}

@end
