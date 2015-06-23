//
//  ViewController.h
//  PageViewDemo
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 PageViewController的Data Source负责按照（PageViewController的）需要提供内容VC。
 我们通过实现Data Source协议告知PageViewController每个页面显示什么内容。
 在此中，使用ViewController类作为UIPageViewController的Data Source。
 因此需要声明在ViewController类中声明它实现了UIPageViewControllerDateSource协议。
 */
@interface ViewController : UIViewController<UIPageViewControllerDataSource>


- (IBAction)startWalkthrough:(id)sender;

/*
 ViewController类还负责向内容VC提高数据（图片和标题）。
 属性来保存UIPageViewController，同样的，创建图片和标题的属性。 
 */
@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *pageTitles;

@property (strong, nonatomic) NSArray *pageImages;

@property (strong, nonatomic) NSArray *pageIntroduces;
@end

