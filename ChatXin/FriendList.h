//
//  FriendList.h
//  ChatXin
//
//  Created by Zlocal on 16/2/24.
//  Copyright © 2016年 Zlocal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendList : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_userlist;
    UITableView *_tableView;
}
@end
