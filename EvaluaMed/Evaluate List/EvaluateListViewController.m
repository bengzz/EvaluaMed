//
//  EvaluateListViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 10/12/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "EvaluateListViewController.h"
#import "ECell.h"

@interface EvaluateListViewController (){
    NSMutableArray *students;
}

@end

@implementation EvaluateListViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.validar = @"null";
}

-(void) loadData
{
    NSString *url = @"http://evaluacionqx.com/android/get-data.php";
    
    NSURL *myUrl = [[NSURL alloc] initWithString:url];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:myUrl
                                                  cachePolicy:NSURLRequestReloadIgnoringCacheData
                                              timeoutInterval:60];
    
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    self.responseData = [[NSMutableData alloc] init];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!students) {
        students = [[NSMutableArray alloc] init];
    }
    [students insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"students %lu",(unsigned long)students.count);
    
    return students.count;
}

-(void) mensajeError
{
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                     message:@"No students found"
                                                    delegate:self
                                           cancelButtonTitle:@"Ok"
                                           otherButtonTitles:nil];
    
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ECell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentsCell" forIndexPath:indexPath];
    
    NSDictionary *miDicc = students[indexPath.row];
    cell.labelStudentName.text = [miDicc objectForKey:@"nombre"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [students removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - NSURLConnectionDataDelegate

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //response data es donde se van a guardar los datoss
    [self.responseData appendData:data];
    
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    int statusCode = [httpResponse statusCode];
    //escribir en el debugger
    NSLog(@"status code %d",statusCode);
    
    if (statusCode == 200 ) {
        self.validar = @"good";
    }
    [self.responseData setLength:0];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    //recibe los datos
    //se hace un parser de json
    NSError *error;
    NSArray *datos = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
    
    if (!students) {
        students = [[NSMutableArray alloc] init];
    }
    
    for(NSDictionary *item in datos) {
        NSLog(@"Item: %@", item);
        [students addObject:item];
    }
    
    [self.tableView reloadData];
    
    if (students.count == 0 && [self.validar  isEqual: @"good"]) {
        [self mensajeError];
    }

}

#pragma mark - NSURLConnectionDelegate

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error %ld",(long)error.code);
    if (error.code == -1009) {
        NSLog(@"There IS NO internet connection");
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:@"No internet connection"
                                                        delegate:self
                                               cancelButtonTitle:@"Ok"
                                               otherButtonTitles:nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
        
    } else if (error.code == -1003) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:@"No connection to server"
                                                        delegate:self
                                               cancelButtonTitle:@"Ok"
                                               otherButtonTitles:nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
    }
    else
    {
        NSLog(@"There IS internet connection");
    }
    
}


@end
