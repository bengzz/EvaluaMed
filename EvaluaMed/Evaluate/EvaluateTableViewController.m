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
    
    arrayDescription = [NSArray arrayWithObjects: @"Es capaz de relacionar la situación clínica que se le presenta con su conocimiento médico. Conoce los métodos diagnósticos y tratamiento al nivel del curso.", @"Actualizado, extenso, organizado, adecuado al nivel del curso.", @"Bien dirigido, lógico, completo.", @"Completa, organizada, bien dirigida.", @"Expediente clínico ordenado, bien integrado, da seguimiento al paciente.", @"Conoce el paciente, sus diagnósticos, anatomía, técnica quirúrgica y potenciales complicaciones.", @"Tiene una comunicación efectiva con el paciente y su familia, excelente comunicación oral, escrita y telefónica.", @"Demuestra respeto, compasión, empatía con el paciente y su familia. Busca el mayor beneficio del paciente, respeta a otros alumnos, profesores, residentes y personal de salud.", @"Siempre llega a tiempo, cuida su apariencia, demuestra interés por aprender. Reconoce debilidades y fortalezas. Cumple siempre sus compromisos. Busca la excelencia.", @"", nil];
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
    return 265.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EVACell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellEvaluate" forIndexPath:indexPath];
    cell.labelTitle.text = [arrayTitle objectAtIndex: indexPath.row];
    cell.labelDescription.text = [arrayDescription objectAtIndex:indexPath.row];
    
    cell.button40.tag = indexPath.row;
    cell.button50.tag = indexPath.row;
    cell.button60.tag = indexPath.row;
    cell.button70.tag = indexPath.row;
    cell.button75.tag = indexPath.row;
    cell.button80.tag = indexPath.row;
    cell.button90.tag = indexPath.row;
    cell.button95.tag = indexPath.row;
    cell.button100.tag = indexPath.row;
    
    [cell.button40 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button50 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button60 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button70 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button75 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button80 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button90 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button95 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button100 addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}


-(void)yourButtonClicked:(UIButton*)sender
{
    if (sender.tag == 0)
    {
        //aqui puedo cambiar el color
        NSLog(@"hola");
    }
}

- (IBAction)selfnavigationControllerpopViewControllerAnimatedYESbuttonSend:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
