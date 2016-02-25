//
//  ViewController.m
//  ChatXin
//
//  Created by Zlocal on 16/2/24.
//  Copyright © 2016年 Zlocal. All rights reserved.
//

#import "ViewController.h"
#import "EMSDK.h"



#import "PersonManager.h"
#import "FriendList.h"
#import "MessageList.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if (_autoLoginSwitch.on==YES) {
//        EMError *error = [[EMClient sharedClient] loginWithUsername:@"本地数据id" password:@"读取本地数据psw"];
//        if (!error) {
//            NSLog(@"自动登录成功,跳转");
//        }
//    }
    
    
    
    _userPSW.secureTextEntry = YES;
    //_userPSW.keyboardType = UIKeyboardTypeNumberPad;

}
- (IBAction)registerBtn:(UIButton *)sender
{
    EMError *error = [[EMClient sharedClient] registerWithUsername:_userId.text password:_userPSW.text];
    if (error==nil) {
        NSLog(@"注册成功");
    }

}
- (IBAction)loginBtn:(UIButton *)sender
{
    if (_autoLoginSwitch.on ==NO) {
        EMError *error = [[EMClient sharedClient] loginWithUsername:_userId.text password:_userPSW.text];
        if (!error) {
            NSLog(@"登陆成功,不自动登录");
        }

    }else{
        EMError *error = [[EMClient sharedClient] loginWithUsername:_userId.text password:_userPSW.text];
        if (!error) {
            [[EMClient sharedClient].options setIsAutoLogin:YES];
            
            NSLog(@"登陆成功,自动登录已经打开,保存数据到本地");
            [self tabbar];
        }

    }
}

- (void)tabbar
{
    PersonManager *personVC = [[PersonManager alloc]init];
    FriendList  *friendVC = [[FriendList alloc]init];
    MessageList *mesVC = [[MessageList alloc]init];
    UINavigationController* navper = [[UINavigationController alloc] initWithRootViewController:personVC];
    UINavigationController* navfri = [[UINavigationController alloc] initWithRootViewController:friendVC];
    UINavigationController* navmes = [[UINavigationController alloc] initWithRootViewController:mesVC];
    
    UITabBarItem *person =[[UITabBarItem alloc]initWithTitle:@"管理" image:[UIImage imageNamed:@"3"]tag:1];
    UITabBarItem *friend = [[UITabBarItem alloc]initWithTitle:@"好友" image:[UIImage imageNamed:@"1"] tag:2];
    UITabBarItem *message = [[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"4"] tag:3];
    
    
    personVC.tabBarItem = person;
    friendVC.tabBarItem = friend;
    mesVC.tabBarItem = message;
    
    
    UITabBarController *tabbar = [[UITabBarController alloc]init];
    tabbar.viewControllers = @[navmes,navfri,navper];
    [[[UIApplication sharedApplication]delegate]window].rootViewController=tabbar;
    [[[[UIApplication sharedApplication]delegate]window]makeKeyAndVisible];
}















- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
