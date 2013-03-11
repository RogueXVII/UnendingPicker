//
//  ViewController.m
//  UnendingPicker
//
//  Created by William Hooper on 1/29/13.
//  Copyright (c) 2013 William Hooper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    column0Titles = [[NSArray alloc]initWithObjects:@"$",@"$$",@"$$$",@"$$$$",@"$$$$$", nil];
    column1Titles = [[NSArray alloc]initWithObjects:@"Mexican",@"Chinese",@"Italian",@"Greek",@"Indian",@"Japanese",@"Korean",@"Polish",@"German", nil];
    column2Titles = [[NSArray alloc]initWithObjects:@"Delivery",@"Fast Food",@"Casual Restaurant",@"Fine Dining", nil];
    selectedRowOfColumn0 = 0;
    selectedRowOfColumn1 = 0;
    selectedRowOfColumn1 = 0;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (int x = 0; x < [self.pkrVwMain numberOfComponents]; x++)
    {
        [self.pkrVwMain selectRow:5000 inComponent:x animated:NO];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10000;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [column0Titles objectAtIndex:row%[column0Titles count]];
            break;
        case 1:
            return [column1Titles objectAtIndex:row%[column1Titles count]];
            break;
        case 2:
            return [column2Titles objectAtIndex:row%[column2Titles count]];
            break;
            
        default:
            break;
    }
    return [NSString stringWithFormat:@"Comp %d, Row %d",component,row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"Selection Made" message:[NSString stringWithFormat:@"Selected Comp %d, Row %d",component,row] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Not OK",@"Bad", nil];
//    [myAlert show];
    int MyRow;
    switch (component) {
        case 0:
            MyRow = row%[column0Titles count];
            selectedRowOfColumn0 = MyRow;
            NSLog(@"Index %d",selectedRowOfColumn0);
            NSLog(@"Selected Comp %d, Row %d, Title: %@",component,row,[column0Titles objectAtIndex:row%[column0Titles count]]);
            MyRow += 5000-5000%[column0Titles count];
            break;
        case 1:
            MyRow = row%[column1Titles count];
            selectedRowOfColumn1 = MyRow;
            NSLog(@"Index %d",selectedRowOfColumn1);
            NSLog(@"Selected Comp %d, Row %d, Title: %@",component,row,[column1Titles objectAtIndex:row%[column1Titles count]]);
            MyRow += 5000-5000%[column1Titles count];
            break;
        case 2:
            MyRow = row%[column2Titles count];
            selectedRowOfColumn2 = MyRow;
            NSLog(@"Index %d",selectedRowOfColumn2);
            NSLog(@"Selected Comp %d, Row %d, Title: %@",component,row,[column2Titles objectAtIndex:row%[column2Titles count]]);
            MyRow += 5000-5000%[column2Titles count];
            break;
            
        default:
            MyRow = 0;
            break;
    }
    
    [self.pkrVwMain selectRow:MyRow inComponent:component animated:NO];
    
    
    NSLog(@"Set to Comp %d, Row %d",component,MyRow);
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button %d clicked.",buttonIndex);
}

/*
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Dismissed with button %d",buttonIndex);
}
*/
- (IBAction)SelectBtnPushed:(id)sender
{
    NSLog(@"User Selected %@, %@, %@",[column0Titles objectAtIndex:selectedRowOfColumn0],[column1Titles objectAtIndex:selectedRowOfColumn1],[column2Titles objectAtIndex:selectedRowOfColumn2]);
}

- (IBAction)RandomBtnPushed:(id)sender
{
    [self.pkrVwMain selectRow:[column0Titles count] inComponent:0 animated:NO];
    [self.pkrVwMain selectRow:[column1Titles count] inComponent:1 animated:NO];
    [self.pkrVwMain selectRow:[column2Titles count] inComponent:2 animated:NO];
    
    for (int x = 0; x < [self.pkrVwMain numberOfComponents]; x++)
    {
        int Randy = rand()%5000+5000;
        [self.pkrVwMain selectRow:Randy inComponent:x animated:YES];
        NSLog(@"Random Selected Comp: %d, Row: %d",x,Randy);
    }

}
@end
