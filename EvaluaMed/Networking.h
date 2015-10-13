//
//  Networking.h
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/12/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AFNetworking.h"

@interface Networking : NSObject

- (void)authenticateWithUserEmail:(NSString *)pUserEmail withUserPassword:(NSString *)pUserPassword completion:(void (^)(BOOL success))completionBlock;

@end
