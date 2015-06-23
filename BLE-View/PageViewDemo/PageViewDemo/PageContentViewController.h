//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UITextView *introduce;


/**
 *pageIndex属性用来储存当前页面的索引（位置）。
 */
@property NSUInteger pageIndex;

/**
 *这个View Controller用来显示一张图片和一个标题，
 *创建两个属性分别用来接收titleText和imageFile。 
 */
@property NSString *titleText;

@property NSString *imageFile;

@property NSString *introduceText;

@end
