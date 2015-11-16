//
//  FinalDestinationViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 11/15/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "FinalDestinationViewController.h"
#import "SBJson.h"
#import "EvaluateListViewController.h"

@interface FinalDestinationViewController ()
@property (strong, nonatomic) IBOutlet UILabel *labelGrade;
@property (strong, nonatomic) IBOutlet UITextField *labelComment;
@property (strong, nonatomic) IBOutlet UIButton *buttonSave;

@end

@implementation FinalDestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"grado %f", self.average);
    self.labelGrade.text = [NSString stringWithFormat:@"%.1f", self.average];
    self.labelComment.delegate = self;
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

- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}

- (IBAction)buttonSave:(id)sender {
    
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *todayIsTheGreatest = [dateFormatter stringFromDate:todayDate];
    
    if (self.labelComment.text.length == 0) {
        self.labelComment.text = @"";
    }
    
    @try {
            NSString *post =[[NSString alloc] initWithFormat:@"usuario=%@&ID=%@&promedio=%@&fecha=%@&comentarios=%@&juicio=%@&conocimiento=%@&interrogatorio=%@&fisico=%@&clinico=%@&quirurgico=%@&comunicacion=%@&desempeno=%@&desarrollo=%@",self.professorID,[_detailItem objectForKey:@"id_alumno"], self.labelGrade.text, todayIsTheGreatest, self.labelComment.text, [self.grades objectAtIndex:0], [self.grades objectAtIndex:1], [self.grades objectAtIndex:2], [self.grades objectAtIndex:3], [self.grades objectAtIndex:4], [self.grades objectAtIndex:5], [self.grades objectAtIndex:6], [self.grades objectAtIndex:7], [self.grades objectAtIndex:8]];
        
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://evaluacionqx.com/android/inserta.php"];
            
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
                
                    [self alertStatus:@"Los datos fueron guardados correctamente." :@"Registro Exitoso!"];
                    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
            }
            else {
                
                [self alertStatus:@"Los datos no fueron guardados." :@"Registro Fallido!"];
            }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Los datos no fueron guardados." :@"Registro Fallido!"];
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
