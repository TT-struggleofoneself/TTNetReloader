//
//  ViewController.m
//  TTNetReloader
//
//  Created by TT_code on 16/4/26.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import "ViewController.h"
#import "TTNetReloader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


/**
 *  无数据
 *
 */
- (IBAction)NotData:(UIButton *)sender {
    __block TTNetReloader* netreloader=[[TTNetReloader alloc]initWithView:self.view imagename:@"leaf" promptTitle:@"暂无数据" buttontitle:@"点击增加" ButtonClickBlock:^{
        [netreloader dismiss];
    }];
}


/**
 *  无网络
 *
 */
- (IBAction)NotNet:(UIButton *)sender {
    __block TTNetReloader* netreloader=[[TTNetReloader alloc]initWithView:self.view imagename:@"no-wifi" promptTitle:@"网络中断啦" ButtonClickBlock:^{
        [netreloader dismiss];
    }];
    
}


@end
