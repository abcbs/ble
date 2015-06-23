//
//  PlayerCellTableViewCell.h
//  TabbedExample
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCellTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet
    UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet
    UILabel *gameLabel;
@property (nonatomic, strong) IBOutlet
    UIImageView *ratingImageView;
@end
