//
//  ViewController.m
//  UIView-ZQuartz
//
//  Created by Adsmart on 17/1/11.
//  Copyright © 2017年 Adsmart. All rights reserved.
//

#import "ViewController.h"
#import "DrawGraphicsViewController.h"
#import "TestView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,copy) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource = @[@"绘制图片",@"绘制文字",@"绘制带边框线的矩形",@"绘制圆角矩形",@"绘制画多边形",@"绘制圆形",@"三点绘制贝塞尔曲线",@"两点绘制贝塞尔曲线",@"绘制弧线",@"绘制扇形",@"绘制折线 ，连续直线"];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    TestView *testView = [[TestView alloc] initWithFrame:CGRectMake(30, 20, 250, 300)];
//    testView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:testView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    if (indexPath.row < self.dataSource.count) {
        cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DrawGraphicsViewController *dvc = [[DrawGraphicsViewController alloc] init];
    dvc.type = indexPath.row;
    [self presentViewController:dvc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
