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

- (IBAction)buttonSend:(id)sender {
    @try {
        
        
        if([self.labelUser.text isEqualToString:@""]) {
            [self alertStatus:@"Please enter both Username" :@"Password Recovery Failed!"];
        } else {
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
                    NSLog(@"Login SUCCESS");
                    [self alertStatus:@"Password Recovery Successfully." :@"Password Recovery Successfully!"];
                    [self.navigationController popViewControllerAnimated:YES];
        
                } else {
                    
                    NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                    [self alertStatus:error_msg :@"Password Recovery Failed"];
                }
                
            } else {
                if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Password Recovery Failed" :@"Password Recovery Failed"];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Password Recovery Successfully." :@"Password Recovery Successfully!"];
        [self.navigationController popViewControllerAnimated:YES];    }
}
@end

