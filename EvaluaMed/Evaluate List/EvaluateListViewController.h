//
//  EvaluateListViewController.h
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/12/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateListViewController : UITableViewController <NSURLConnectionDataDelegate, NSURLConnectionDelegate, UISearchDisplayDelegate>
@property (strong,nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSString *validate;
@property (strong, nonatomic) NSString *professorID;

@end
