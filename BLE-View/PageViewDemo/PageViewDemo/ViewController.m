//
//  ViewController.m
//  PageViewDemo
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //数据模型
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
    _pageIntroduces=@[@"白糖1茶匙豌豆淀粉20克大葱2根醋1汤匙酱油2茶匙干花椒粒10克大蒜2瓣料酒1茶匙干辣椒10克食盐1茶匙胡椒粉1茶匙姜1块花椒1把",
                      @"登录耐克中国官网,了解全新运动训练理念.NIKE ELITE SERIES篮球精英系列,采用全新设计和创新科技,进一步提升球场表现.全新FREE跑步系列,营造舒适的穿着感受,畅享自然流畅步伐.全新TECH HYPERFUSE轻盈上市,采用革新科技的耐磨尼龙,让整个夏天都轻盈透气.Inspiration and innovation for every athlete in the world. Experience sports, training, shopping and everything else that is new at Nike.                      ",
                      @"nspiration and innovation for every athlete in the world. Experience sports, training, shopping and everything else that is new at Nike.",
                      @"测试"];
    _pageImages = @[@"page1.jpg", @"page2.jpg", @"page3.jpg", @"page4.jpg"];
    
    //创建页视图
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    
    self.pageViewController.dataSource = self;
 
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = @[startingViewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
   
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width,
                                                    self.view.frame.size.height - 30);
 
    [self addChildViewController:_pageViewController];
    
    [self.view addSubview:_pageViewController.view];
    
    [self.pageViewController didMoveToParentViewController:self];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"ViewController didReceiveMemoryWarning,Dispose of any resources that can be recreated.");
}


- (IBAction)startWalkthrough:(id)sender {
    
    NSLog(@"startWalkthrough 按钮开始的动作");
}

#pragma mark - Page View Controller Data Source
/**
 *viewControllerBeforeViewController
 *提供当前View Controller的前一个View Controller。
 *换言之，我们告诉app上一页显示什么内容。
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;

    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }

    index--;
    return [self viewControllerAtIndex:index];
}

/**
 *viewControllerAfterViewController –
 *提供当前View Controller的后一个View Controller。
 *换言之，我们告诉app下一页显示什么内容。
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;

    if (index == NSNotFound) {
        return nil;
    }

    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

/**
 *首先，我们获取当前的页码，简单地增加/减少页码并返回要显示的View Controller。
 *当然，我们需要做边缘检查，并在超出时返回nil。
 *
 *一个用来创建所需位置的内容VC的辅助方法。它接收一个index参数并创建对应的内容VC。
 */
- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    //PageContentController                      PageContentViewController    
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    pageContentViewController.imageFile = self.pageImages[index];
    
    pageContentViewController.titleText = self.pageTitles[index];
    
    pageContentViewController.introduceText = self.pageIntroduces[index];
    
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

/*
 *下面两个方法也非常简单。我们仅仅是告诉iOS我们一共需要显示多少页面，以及默认选择的第一页。
 *注意：你必须实现上面的方法才能显示页面指示器（Page Indicator）。
 *而且，页面指示器只在滑动切换模式下起作用。
 */
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end
