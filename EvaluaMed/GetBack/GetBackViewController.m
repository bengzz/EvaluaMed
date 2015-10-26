//
//  GetBackViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/22/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "GetBackViewController.h"

@interface GetBackViewController ()
@property (strong, nonatomic) IBOutlet UITextField *labelUser;
@property (strong, nonatomic) IBOutlet UIButton *buttonSend;

@end

@implementation GetBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonSend:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}
@end

