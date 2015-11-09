//
//  EvaluateTableViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 11/9/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "EvaluateTableViewController.h"
#import "EVACell.h"

@interface EvaluateTableViewController (){
    NSArray *arrayTitle;
    NSArray *arrayDescription;
}

@end

@implementation EvaluateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayTitle = [NSArray arrayWithObjects: @"1. Juicio Clínico", @"2. Aplicación conocimiento médico", @"3. Aplicación habilidades clínicas: Interrogatorio", @"Exploración Física", @"Expediente Clínico", @"Comportamiento quirúrgico", @"4. Comunicación Efectiva", @"5. Desempeño en sistema salud", @"6. Desarrollo Personal", @"7. Impresión General del Alumno", nil];
    // Do any additional setup after loading the view, typically from a nib.
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EVACell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellEvaluate" forIndexPath:indexPath];
    cell.labelTitle.text = [arrayTitle objectAtIndex: indexPath.row];
    return cell;
}

- (IBAction)selfnavigationControllerpopViewControllerAnimatedYESbuttonSend:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
