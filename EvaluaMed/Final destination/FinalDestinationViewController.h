//
//  FinalDestinationViewController.h
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 11/15/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalDestinationViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSString *professorID;
@property (strong, nonatomic) NSMutableArray *grades;
@property (nonatomic) float average;

@end
