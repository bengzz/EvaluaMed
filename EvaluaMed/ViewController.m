//
//  ViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/6/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageIntro;
@property (strong, nonatomic) IBOutlet UIButton *buttonStudents;
@property (strong, nonatomic) IBOutlet UIButton *buttonEvaluate;
@property (strong, nonatomic) IBOutlet UIButton *buttonAccount;
@property (strong, nonatomic) IBOutlet UIButton *buttonLogin;
@property (strong, nonatomic) IBOutlet UIButton *buttonLogout;
@property (strong, nonatomic) IBOutlet UITextField *labelUser;
@property (strong, nonatomic) IBOutlet UITextField *labelPassword;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonLogin:(id)sender {
    self.buttonStudents.hidden = false;
    self.buttonAccount.hidden = false;
    self.buttonEvaluate.hidden = false;
    self.buttonLogout.hidden = false;
    self.buttonLogin.hidden = true;
    self.labelUser.hidden = true;
    self.labelPassword.hidden = true;
}
- (IBAction)buttonLogout:(id)sender {
    self.buttonStudents.hidden = true;
    self.buttonAccount.hidden = true;
    self.buttonEvaluate.hidden = true;
    self.buttonLogout.hidden = true;
    self.buttonLogin.hidden = false;
    self.labelUser.hidden = false;
    self.labelPassword.hidden = false;
}

@end
