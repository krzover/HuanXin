//
//  FriendList.m
//  ChatXin
//
//  Created by Zlocal on 16/2/24.
//  Copyright © 2016年 Zlocal. All rights reserved.
//

#import "FriendList.h"
#import "EMSDK.h"
#import "AddFriendView.h"


@interface FriendList ()

@end

@implementation FriendList

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"好友";
    
    UIBarButtonItem *addFriend = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addfriend)];
    self.navigationItem.rightBarButtonItem = addFriend;
    
    _userlist = [[NSArray alloc]init];
    
    EMError *error = nil;
    _userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
    if (!error) {
        NSLog(@"获取成功 -- %@",_userlist);
    }
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _userlist.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"copy"];
    if (!cell) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"copy"];
        cell.textLabel.text = [_userlist objectAtIndex:indexPath.row];
        
    }
    return cell;
}





- (void)addfriend
{
    AddFriendView *addvc = [[AddFriendView alloc]init];
    [self.navigationController pushViewController:addvc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
