//
//  SelectPickUIViewController.h
//  TabbedExample
//
//  Created by admin on 15/6/20.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectPickUIViewController : UIViewController<UIPickerViewDelegate, UITextFieldDelegate,UIPickerViewDataSource>
{
    NSArray *pickerArray;
}
@property (weak, nonatomic) IBOutlet UIPickerView *selectPicker;

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)doneToolbar:(id)sender;

@end
