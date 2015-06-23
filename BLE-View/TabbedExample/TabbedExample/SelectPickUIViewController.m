//
//  SelectPickUIViewController.m
//  TabbedExample
//
//  Created by admin on 15/6/20.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import "SelectPickUIViewController.h"

@interface SelectPickUIViewController ()

@end

@implementation SelectPickUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pickerArray = [NSArray arrayWithObjects:@"动物",@"植物",@"石头",@"天空", nil];
    _textField.inputView = _selectPicker;
   // _textField.inputAccessoryView = _doneToolbar;
    _textField.delegate = self;
    _selectPicker.delegate = self;
    _selectPicker.dataSource = self;
    _selectPicker.frame = CGRectMake(0, 480, 320, 216);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneToolbar:(id)sender {
    NSInteger row = [_selectPicker selectedRowInComponent:0];
    self.textField.text = [pickerArray objectAtIndex:row];
     [_textField endEditing:YES];
}

/*
 *返回有几个PickerView
 */
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   
    return [pickerArray objectAtIndex:row];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger row = [_selectPicker selectedRowInComponent:0];
    self.textField.text = [pickerArray objectAtIndex:row];
}




@end
