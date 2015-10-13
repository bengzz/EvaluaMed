//
//  EvaluateListViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/12/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "EvaluateListViewController.h"
#import "ECell.h"

@interface EvaluateListViewController ()

@end

@implementation EvaluateListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ECell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentsCell" forIndexPath:indexPath];
    
    return cell;
    
}


@end
