//
//  PlayersViewController.m
//  TabbedExample
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 KingTeller. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"
#import "PlayerCellTableViewCell.h"

@implementation PlayersViewController

@synthesize players;

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"PlayerCell"];
    
    Player *player = [self.players objectAtIndex:indexPath.row];
    cell.textLabel.text = player.name;
    cell.detailTextLabel.text = player.game;
    
    return cell;   
}
*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"PlayerCellTableViewCell"];
    
    Player *player = [self.players objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    nameLabel.text = player.name;
    
    UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
    gameLabel.text = player.game;
    
    UIImageView * ratingImageView = (UIImageView *)
                [cell viewWithTag:102];
    
    ratingImageView.image = [self imageForRating:player.rating];
    return cell;   
}
*/


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerCellTableViewCell *cell = (PlayerCellTableViewCell *)
    [tableView dequeueReusableCellWithIdentifier:@"PlayerCellTableViewCell"];
    Player *player = [self.players objectAtIndex:indexPath.row];
    cell.nameLabel.text = player.name;
    cell.gameLabel.text = player.game;
    cell.ratingImageView.image = [self
                                  imageForRating:player.rating];
    
    cell.accessoryType = UITableViewCellEditingStyleDelete;
    return cell;
}


- (UIImage *)imageForRating:(int)rating
{
    switch (rating)
    {
        case 1: return [UIImage imageNamed:@"first.png"];
        case 2: return [UIImage imageNamed:@"first.png"];
        case 3: return [UIImage imageNamed:@"first.png"];
        case 4: return [UIImage imageNamed:@"first.png"];
        case 5: return [UIImage imageNamed:@"first.png"];
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    
    return [self.players count];
}


/**
 *在用户选择一 行时,调用返个方法去负责行选择。在返个方法里面,
 *添加代码来指定具体业务行为,在行选择的时候调用
 *
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rec=[[players objectAtIndex:indexPath.row] name];
    
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"行选择" message:rec delegate:nil cancelButtonTitle:@"确定"
                                 otherButtonTitles:nil];
    // Display Alert Message
    [messageAlert show];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    [self.players removeObjectAtIndex:indexPath.row];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/**
 *删除
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Remove the row from data model
        [self.players removeObjectAtIndex:indexPath.row];
        
        //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        //Request table view to reload
        [tableView reloadData];
        
    }
}

#pragma mark - PlayerDetailsViewControllerDelegate
- ( void ) playerDetailsViewControllerDidCancel :  ( PlayerDetailsViewController *) controller {
    [ self dismissViewControllerAnimated : YES completion : nil ] ;
}
- ( void ) playerDetailsViewControllerDidSave :
        ( PlayerDetailsViewController *) controller {
    
    [self dismissViewControllerAnimated : YES completion : nil ] ;
    [self.players addObject:controller.player ];
    [self.tableView reloadData];
}

- ( void ) prepareForSegue :( UIStoryboardSegue *) segue sender :( id ) sender {
   if ([ segue.identifier isEqualToString : @ "AddPlayer" ]) {
      UINavigationController * navigationController = segue.destinationViewController;
       PlayerDetailsViewController * playerDetailsViewController = [[ navigationController viewControllers ] objectAtIndex : 0 ] ;
       playerDetailsViewController.delegate = self;
   }
}


@end
