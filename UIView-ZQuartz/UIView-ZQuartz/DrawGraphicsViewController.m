//
//  DrawGraphicsViewController.m
//  UIView-ZQuartz
//
//  Created by Adsmart on 17/1/11.
//  Copyright © 2017年 Adsmart. All rights reserved.
//

#import "DrawGraphicsViewController.h"

@interface DrawGraphicsViewController ()

@end

@implementation DrawGraphicsViewController

- (void)setType:(NSInteger)type {
    
    _type = type;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ModelView *modelView = [[ModelView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:modelView];
    modelView.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    modelView.type = _type;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
