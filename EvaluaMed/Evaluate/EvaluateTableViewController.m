//
//  EvaluateTableViewController.m
//  EvaluaMed
//
//  Created by Benjamin Gonzalez on 11/9/15.
//  Copyright (c) 2015 ITESM. All rights reserved.
//

#import "EvaluateTableViewController.h"
#import "FinalDestinationViewController.h"
#import "EVACell.h"

@interface EvaluateTableViewController (){
    NSArray *arrayTitle;
    NSArray *arrayDescription;
    float grade[9];
}

@end

@implementation EvaluateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayTitle = [NSArray arrayWithObjects: @"1. Juicio Clínico", @"2. Aplicación conocimiento médico", @"3. Aplicación habilidades clínicas: Interrogatorio", @"Exploración Física", @"Expediente Clínico", @"Comportamiento quirúrgico", @"4. Comunicación Efectiva", @"5. Desempeño en sistema salud", @"6. Desarrollo Personal", nil];
    
    arrayDescription = [NSArray arrayWithObjects: @"Es capaz de relacionar la situación clínica que se le presenta con su conocimiento médico. Conoce los métodos diagnósticos y tratamiento al nivel del curso.", @"Actualizado, extenso, organizado, adecuado al nivel del curso.", @"Bien dirigido, lógico, completo.", @"Completa, organizada, bien dirigida.", @"Expediente clínico ordenado, bien integrado, da seguimiento al paciente.", @"Conoce el paciente, sus diagnósticos, anatomía, técnica quirúrgica y potenciales complicaciones.", @"Tiene una comunicación efectiva con el paciente y su familia, excelente comunicación oral, escrita y telefónica.", @"Demuestra respeto, compasión, empatía con el paciente y su familia. Busca el mayor beneficio del paciente, respeta a otros alumnos, profesores, residentes y personal de salud.", @"Siempre llega a tiempo, cuida su apariencia, demuestra interés por aprender. Reconoce debilidades y fortalezas. Cumple siempre sus compromisos. Busca la excelencia.", nil];
    
    for (NSInteger i = 0; i < 9; i++)
        grade[i] = 0;
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - setdetail

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EVACell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellEvaluate" forIndexPath:indexPath];

    cell.labelTitle.text = [arrayTitle objectAtIndex: indexPath.row];
    
    cell.button60.tag = indexPath.row;
    cell.button60.titleLabel.text = @"60";
    cell.button70.tag = indexPath.row;
    cell.button70.titleLabel.text = @"70";
    cell.button75.tag = indexPath.row;
    cell.button75.titleLabel.text = @"75";
    cell.button80.tag = indexPath.row;
    cell.button80.titleLabel.text = @"80";
    cell.button90.tag = indexPath.row;
    cell.button90.titleLabel.text = @"90";
    cell.button95.tag = indexPath.row;
    cell.button95.titleLabel.text = @"95";
    cell.button100.tag = indexPath.row;
    cell.button100.titleLabel.text = @"100";
    cell.buttonInfo.tag = indexPath.row;
    
    [cell.button60 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button70 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button75 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button80 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button90 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button95 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button100 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.buttonInfo addTarget:self action:@selector(ButtonInfoClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.button60 setImage:[UIImage imageNamed:@"6.png"] forState:UIControlStateNormal];
    [cell.button70 setImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
    [cell.button75 setImage:[UIImage imageNamed:@"7.5.png"] forState:UIControlStateNormal];
    [cell.button80 setImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateNormal];
    [cell.button90 setImage:[UIImage imageNamed:@"9.png"] forState:UIControlStateNormal];
    [cell.button95 setImage:[UIImage imageNamed:@"9.5.png"] forState:UIControlStateNormal];
    [cell.button100 setImage:[UIImage imageNamed:@"10.png"] forState:UIControlStateNormal];

    if (grade[indexPath.row] == 6) {
        [cell.button60 setImage:[UIImage imageNamed:@"6b.png"] forState:UIControlStateNormal];
    }
    else if (grade[indexPath.row] == 7) {
        [cell.button70 setImage:[UIImage imageNamed:@"7b.png"] forState:UIControlStateNormal];
    }
    else if (grade[indexPath.row] == 7.5) {
        [cell.button75 setImage:[UIImage imageNamed:@"7.5b.png"] forState:UIControlStateNormal];
    }
    else if (grade[indexPath.row] == 8) {
        [cell.button80 setImage:[UIImage imageNamed:@"8b.png"] forState:UIControlStateNormal];
    }
    else if (grade[indexPath.row] == 9) {
        [cell.button90 setImage:[UIImage imageNamed:@"9b.png"] forState:UIControlStateNormal];
    }
    else if (grade[indexPath.row] == 9.5) {
        [cell.button95 setImage:[UIImage imageNamed:@"9.5b.png"] forState:UIControlStateNormal];
    }
    else if (grade[indexPath.row] == 10) {
        [cell.button100 setImage:[UIImage imageNamed:@"10b.png"] forState:UIControlStateNormal];
    }
    
    return cell;
}


-(void)yourButtonClicked:(UIButton*)sender
{
    NSInteger gradeNumber = grade[sender.tag] * 10;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
    grade[sender.tag] = 0;
    if ([sender.titleLabel.text isEqualToString:@"60"]) {
        if (gradeNumber != 60) {
            grade[sender.tag] = 6;
        }}
    else if ([sender.titleLabel.text isEqualToString:@"70"]) {
        if (gradeNumber != 70) {
            grade[sender.tag] = 7;
        }}
    else if ([sender.titleLabel.text isEqualToString:@"75"]) {
        if (gradeNumber != 75) {
            grade[sender.tag] = 7.5;
        }}
    else if ([sender.titleLabel.text isEqualToString:@"80"]) {
        if (gradeNumber != 80) {
            grade[sender.tag] = 8;
        }}
    else if ([sender.titleLabel.text isEqualToString:@"90"]) {
        if (gradeNumber != 90) {
            grade[sender.tag] = 9;
        }}
    else if ([sender.titleLabel.text isEqualToString:@"95"]) {
        if (gradeNumber != 95) {
            grade[sender.tag] = 9.5;
        }}
    else if ([sender.titleLabel.text isEqualToString:@"100"]) {
        if (gradeNumber != 100) {
            grade[sender.tag] = 10;
        }}
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    NSLog(@"valor %f", grade[sender.tag]);
}

#pragma mark - info
- (void) InfoStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *infoView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [infoView show];
}

-(void)ButtonInfoClicked:(UIButton*)sender
{
    [self InfoStatus:[arrayDescription objectAtIndex: sender.tag] :@"Detalle"];
}

- (IBAction)selfnavigationControllerpopViewControllerAnimatedYESbuttonSend:(id)sender {
    [self performSegueWithIdentifier:@"showDetail" sender:self];
    //pasar arreglo y hacer la suma en la siguiente vista
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        [[segue destinationViewController] setDetailItem:_detailItem];
        FinalDestinationViewController *destiny = [segue destinationViewController];
        destiny.professorID = self.professorID;
    }
}


@end
