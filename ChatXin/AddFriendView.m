//
//  AddFriendView.m
//  ChatXin
//
//  Created by Zlocal on 16/2/24.
//  Copyright © 2016年 Zlocal. All rights reserved.
//

#import "AddFriendView.h"
#import "EMSDK.h"
@interface AddFriendView ()
{
    UISearchBar *ssearch;
}
@end

@implementation AddFriendView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加好友";
    ssearch = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 66, 200, 50)];
    ssearch.showsCancelButton = YES;
    ssearch.delegate = self;
    [self.view addSubview:ssearch];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    EMError *error = [[EMClient sharedClient].contactManager addContact:ssearch.text message:@"我想加您为好友"];
    if (!error) {
        NSLog(@"添加成功");
    }
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
