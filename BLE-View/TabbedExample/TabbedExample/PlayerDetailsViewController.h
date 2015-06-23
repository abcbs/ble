//
//  PlayerDetailsViewController.h
//  TabbedExample
//
//  Created by admin on 15/6/20.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
/**
 *Segue 只是单向的，从 Players 窗口到新窗口。要想返回，必须使用委托模式。
 */

@class PlayerDetailsViewController;

/**
 *我们定义了一个委托协议，以便当用户点击 Cancel 或者 Done 时，
 *我们能够从AddPlayer 窗口返回到 Players 窗口。
 */
@protocol PlayerDetailsViewControllerDelegate <NSObject>

- (void) playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *) controller;

- (void) playerDetailsViewControllerDidSave:(PlayerDetailsViewController *) controller;

@end


@interface PlayerDetailsViewController : UITableViewController

@property ( nonatomic, weak ) id <PlayerDetailsViewControllerDelegate> delegate;

@property (nonatomic, strong)Player *player;

/**
 *将 Cancel 按钮和 Done 按钮连接至相应的Action 方法
 *这两个方法分别对应两个BarButton。
 *这些方法都通知委托对象什么事件被触发。
 *最终都需要让委托对象去关闭窗口
 */

- (IBAction)done:(id)sender;

- (IBAction)cancel:(id)sender;

/**
 *编辑内容
 */

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end
