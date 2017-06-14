//
//  MainViewController.m
//  百事通
//
//  Created by SXF on 2017/3/23.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航条上标题的颜色
    NSDictionary *navbarTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    
    //导航条上UIBarButtonItem颜色
    [[UINavigationBar appearance] setTintColor:[UIColor blueColor]];

    //TabBar选中图标的颜色,默认是蓝色
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
    //TabBarItem选中的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
    
    //导航条的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];

    self.view.backgroundColor = [UIColor whiteColor];

    [self addChildVc];
}


#pragma mark 添加子控制器
-(void)addChildVc
{
    //1.添加首页控制器
    HomeViewController  *home=[[HomeViewController alloc]init];
    [self addChildViewController:home title:@"首页" image:@"home" selectedImage:@"homeH"];
    //2.全球购
    UIViewController *global=[[UIViewController alloc]init];
    [self addChildViewController:global title:@"关卡" image:@"earth" selectedImage:@"earthH"];
    //3.消息通知
    UIViewController *message=[[UIViewController alloc]init];
    [self addChildViewController:message title:@"小站" image:@"Message" selectedImage:@"MessageH"];
    //4.购物车
    UIViewController *car=[[UIViewController alloc]init];
    [self addChildViewController:car title:@"小主" image:@"cart" selectedImage:@"cartH"];
    //5.我
    UIViewController *me=[[UIViewController alloc]init];
    [self addChildViewController:me title:@"设置" image:@"user" selectedImage:@"userH"];

}
#pragma mark 添加子控制器的方法

-(void)addChildViewController:(UIViewController *)childVc title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage
{
    childVc.navigationItem.title=title;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image=[UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage=[UIImage imageNamed:selectedImage];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
