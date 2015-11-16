//
//  GetBackViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/22/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "GetBackViewController.h"
#import "SBJson.h"

@interface GetBackViewController ()
@property (strong, nonatomic) IBOutlet UITextField *labelUser;
@property (strong, nonatomic) IBOutlet UIButton *buttonSend;

@end

@implementation GetBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelUser.delegate = self;
    // Do any additional setup after loading the view.
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

-(BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}

- (IBAction)buttonSend:(id)sender {
    if ([self validateEmail:self.labelUser.text]) {
        @try {
                NSString *post =[[NSString alloc] initWithFormat:@"usuario=%@",self.labelUser.text];
                NSLog(@"PostData: %@",post);
                
                NSURL *url=[NSURL URLWithString:@"http://evaluacionqx.com/android/olvido.php"];
                
                NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                
                NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
                
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                [request setURL:url];
                [request setHTTPMethod:@"POST"];
                [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                [request setHTTPBody:postData];
                
                
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
                        [self alertStatus:@"Envio de correo" :@"Recuperación de contraseña exitosa!"];
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    } else {
                        
                        NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                        [self alertStatus:error_msg :@"Recuperación de contraseña fallido"];
                    }
                    
                } else {
                    if (error) NSLog(@"Error: %@", error);
                    [self alertStatus:@"Recuperación de contraseña fallido" :@"Error"];
                }
            }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
            [self alertStatus:@"Envio de correo" :@"Recuperación de contraseña."];
            [self.navigationController popViewControllerAnimated:YES];
        }

    }
    else{
        [self alertStatus:@"Favor de ingresar Usuario correctamente" :@"Error"];
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
