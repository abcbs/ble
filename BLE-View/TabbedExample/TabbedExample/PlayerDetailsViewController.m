//
//  PlayerDetailsViewController.m
//  TabbedExample
//
//  Created by admin on 15/6/20.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import "PlayerDetailsViewController.h"
#import "Player.h"
@interface PlayerDetailsViewController ()


@end

@implementation PlayerDetailsViewController

@synthesize delegate;
@synthesize player;

- (void)viewDidLoad {
    [super viewDidLoad];
    //_nameTextField=[[UITextField alloc]init];
    NSLog(@"PlayerDetailsViewController...");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- ( void ) tableView :( UITableView *) tableView didSelectRowAtIndexPath :( NSIndexPath *) indexPath {
    if ( indexPath.section == 0 )
     [ self.nameTextField becomeFirstResponder ] ;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- ( IBAction ) cancel :( id ) sender {
    [ self.delegate playerDetailsViewControllerDidCancel:self ] ;
}

- ( IBAction ) done :( id ) sender {
    NSString *name=self.nameTextField.text;
    NSString *game=self.detailLabel.text;
    player=[[Player alloc]init];
    player.name = name;
    player.game = game;
    player.rating = 5;
    
    [ self.delegate playerDetailsViewControllerDidSave : self ] ;
   
    
}





@end
