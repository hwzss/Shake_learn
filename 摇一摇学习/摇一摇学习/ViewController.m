//
//  ViewController.m
//  摇一摇学习
//
//  Created by qwkj on 2017/6/19.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Shake.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    //*****实现摇一摇方式二，通过获取到coremotion时代responeder的motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event代理方法来获取开始摇动。具体实现见"UIViewController+Shake.h"
    [self WZ_enableShake:^{
          NSLog(@"%s",__func__);
    }];
    self.WZ_spaceTime =2;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
