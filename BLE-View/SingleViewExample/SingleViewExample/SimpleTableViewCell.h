//
//  SimpleTableViewCell.h
//  SingleViewExample
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;

@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;


@end
