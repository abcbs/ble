//
//  PlayerCellTableViewCell.m
//  TabbedExample
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import "PlayerCellTableViewCell.h"

@implementation PlayerCellTableViewCell


@synthesize nameLabel;
@synthesize gameLabel;
@synthesize ratingImageView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
