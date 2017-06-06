//
//  ViewController.m
//  滚动菜单栏
//
//  Created by 蔡强 on 2017/6/6.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "ViewController.h"
#import "CQScrollMenuView.h"
#import "UIView+frameAdjust.h"

@interface ViewController ()<CQScrollMenuViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CQScrollMenuView *menuView = [[CQScrollMenuView alloc]initWithFrame:CGRectMake(0, 90, self.view.width, 30)];
    [self.view addSubview:menuView];
    menuView.menuButtonClickedDelegate = self;
    menuView.titleArray = @[@"button0",@"button1",@"button2",@"button3",@"button4",@"button5",@"button6",@"button7",@"button8",@"button9",@"button10",@"button11"];
}

// 菜单按钮点击时回调
- (void)scrollMenuView:(CQScrollMenuView *)scrollMenuView clickedButtonAtIndex:(NSInteger)index{
    NSLog(@"点击了第%ld个按钮",index);
}


@end
