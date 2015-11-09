//
//  EvaluateTableViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 11/9/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "EvaluateTableViewController.h"
#import "EVACell.h"

@implementation EvaluateTableViewController

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
        NSLog(@"nivel %ld", (long)self.integerLevel);
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EVACell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellEvaluate" forIndexPath:indexPath];
    cell.labelDescription.text = @"hola";
    return cell;
}

- (IBAction)selfnavigationControllerpopViewControllerAnimatedYESbuttonSend:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
