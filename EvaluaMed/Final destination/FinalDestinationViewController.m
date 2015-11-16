//
//  FinalDestinationViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 11/15/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "FinalDestinationViewController.h"

@implementation FinalDestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"grado %f", self.average);
}

#pragma mark - setdetail

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        NSLog(@"detalle %@", _detailItem);
    }
}

@end
