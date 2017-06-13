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

@interface ViewController ()<CQScrollMenuViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) CQScrollMenuView *menuView;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建滚动菜单栏
    self.menuView = [[CQScrollMenuView alloc]initWithFrame:CGRectMake(0, 20, self.view.width, 30)];
    [self.view addSubview:self.menuView];
    self.menuView.menuButtonClickedDelegate = self;
    self.menuView.titleArray = @[@"button0",@"button加长加长版",@"button2",@"button3",@"button4",@"button5",@"button6",@"button7",@"button8",@"button9",@"button10",@"button11"];
    
    // tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.width, self.view.height - 50) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - Delegate - 菜单栏
// 菜单按钮点击时回调
- (void)scrollMenuView:(CQScrollMenuView *)scrollMenuView clickedButtonAtIndex:(NSInteger)index{
    // tableView滚动到对应组
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

#pragma mark - UITableView DataSource & Delegate

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseCellID = @"ReuseCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellID];
    }
    return cell;
}

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

// 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.menuView.titleArray.count;
}

// 组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *reuseHeaderID = @"ReuseHeaderID";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseHeaderID];
    if (headerView == nil) {
        headerView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:reuseHeaderID];
    }
    
    return headerView;
}

// 组头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

// 组头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"第%ld组",section];
}

// 组头将要展示时回调
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    self.menuView.currentButtonIndex = section;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // the real time of webView finish loading
    if ([webView isFinishLoading] == YES) {
        // do something you want
    }
}

@end
