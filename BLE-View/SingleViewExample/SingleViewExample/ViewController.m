//
//  ViewController.m
//  SingleViewExample
//
//  Created by admin on 15/6/18.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableViewCell.h"


@interface ViewController ()



@end

@implementation ViewController

{
    //数据
    NSArray *recipes;
    //缩略图数组
    NSArray *thumbnails;
    //时间数组
    NSArray *prepTime;

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    recipes = [dict objectForKey:@"RecipeName"];
    thumbnails = [dict objectForKey:@"Thumbnail"];
    prepTime = [dict objectForKey:@"PrepTime"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *用于通知表格视图在这个区段（section）中有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

/**
 *表格每一行显示的时候被调用
 */
/*
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    //方法迒回的是一个可重用的表视图单 元格对象。
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text =  [recipes objectAtIndex:indexPath.row];
    
    //cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    cell.imageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];    
    
    return cell;
}
*/

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableViewCell *cell = (SimpleTableViewCell*)
        [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
    
        cell = [nib objectAtIndex:0]; }
    cell.nameLabel.text = [recipes objectAtIndex:indexPath.row];
    
    cell.thumbnailImageView.image =
        [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
    
    return cell;
 
}

/**
 *自定义行的宽度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 78;
}

/**
 *在用户选择一 行时,调用返个方法去负责行选择。在返个方法里面,添加代码来指定具体业务行为,在行选择的时候调用 
 *
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rec=[recipes objectAtIndex:indexPath.row];
    
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"行选择" message:rec delegate:nil cancelButtonTitle:@"确定"
                                 otherButtonTitles:nil];
    // Display Alert Message
    [messageAlert show];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];    
}



- (IBAction)startWalkthrough:(id)sender {
}

@end
