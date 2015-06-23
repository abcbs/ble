//
//  SimpleTableViewCell.m
//  SingleViewExample
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import "SimpleTableViewCell.h"

@implementation SimpleTableViewCell

@synthesize nameLabel = _nameLabel;

@synthesize prepTimeLabel = _prepTimeLabel;

@synthesize thumbnailImageView = _thumbnailImageView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
