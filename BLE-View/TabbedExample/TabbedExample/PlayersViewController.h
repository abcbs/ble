//
//  PlayersViewController.h
//  TabbedExample
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h" 


@interface PlayersViewController : UITableViewController
    <PlayerDetailsViewControllerDelegate>


@property (nonatomic, strong) NSMutableArray *players;

@end
