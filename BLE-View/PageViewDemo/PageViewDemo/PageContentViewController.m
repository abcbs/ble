//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 视图装载之后的其它动作
    NSLog(@"PageContentViewController viewDidLoad");
    // 资源重建
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.introduce.text=self.introduceText;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"PageContentViewController didReceiveMemoryWarning");
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
// 在基于故事板的应用中，在浏览之前需要的准备
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
     NSLog(@"PageContentViewController prepareForSegue");}


@end
