//
//  ViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/6/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "ViewController.h"
#import "SBJson.h"
#import "EvaluateListViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageIntro;
@property (strong, nonatomic) IBOutlet UIButton *buttonLogin;
@property (strong, nonatomic) IBOutlet UIButton *buttonFPassword;
@property (strong, nonatomic) IBOutlet UITextField *labelUser;
@property (strong, nonatomic) IBOutlet UITextField *labelPassword;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelUser.delegate = self;
    self.labelPassword.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.topItem.title = @"";
    self.labelUser.text = @"";
    self.labelPassword.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}

- (IBAction)buttonLogin:(id)sender {
    @try {

        
        if([self.labelUser.text isEqualToString:@""] || [self.labelPassword.text isEqualToString:@""] ) {
            [self alertStatus:@"Favor de ingresar Usuario y Contraseña correctamente" :@"Login Fallido!"];
        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"usuario=%@&password=%@",self.labelUser.text,self.labelPassword.text];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://evaluacionqx.com/android/acces.php"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSLog(@"Response code: %ld", (long)[response statusCode]);
            if ([response statusCode] >=200 && [response statusCode] <300)
            {
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response ==> %@", responseData);
                
                SBJsonParser *jsonParser = [SBJsonParser new];
                NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
                NSLog(@"%@",jsonData);
                NSInteger success = [[[jsonData valueForKey:@"logstatus"] objectAtIndex:0] integerValue];
                NSLog(@"%ld",(long)success);
                if(success == 1)
                {
                    NSLog(@"Login Exitoso!");
                    [self alertStatus:@"Bienvenido" :@"Login Exitoso!"];
                    [self performSegueWithIdentifier:@"showList" sender:self];
                    
                } else {
                    
                    NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                    [self alertStatus:error_msg :@"Login Fallido!"];
                }
                
            } else {
                if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Falla de conexión" :@"Login Fallido!"];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Login Fallido" :@"Login Fallido!"];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showList"]) {
        EvaluateListViewController *destiny = [segue destinationViewController];
        destiny.professorID = self.labelUser.text;
    }
}

#pragma mark - keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

@end
