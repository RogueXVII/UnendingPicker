//
//  ViewController.h
//  UnendingPicker
//
//  Created by William Hooper on 1/29/13.
//  Copyright (c) 2013 William Hooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate>
{
    //Private properties of this class
    NSArray *column0Titles;
    NSArray *column1Titles;
    NSArray *column2Titles;
    
    int selectedRowOfColumn0;
    int selectedRowOfColumn1;
    int selectedRowOfColumn2;
}
@property (weak, nonatomic) IBOutlet UIPickerView *pkrVwMain;
- (IBAction)SelectBtnPushed:(id)sender;
- (IBAction)RandomBtnPushed:(id)sender;

@end
