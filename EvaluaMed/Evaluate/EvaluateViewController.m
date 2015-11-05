//
//  EvaluateViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/13/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "EvaluateViewController.h"
#import "EVCell.h"

@interface EvaluateViewController ()

@end

@implementation EvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        NSLog(@"nivel %ld", (long)self.integerLevel);
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.integerLevel == 1) {
        return 5;
    }
    else if (self.integerLevel == 2){
        return 6;
    }
    else
        return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellEvaluate" forIndexPath:indexPath];
    cell.labelDescription.text = @"hola";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Evaluate
- (IBAction)buttonEvaluate:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}

@end
