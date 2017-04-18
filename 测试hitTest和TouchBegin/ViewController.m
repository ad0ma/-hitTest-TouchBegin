//
//  ViewController.m
//  测试hitTest和TouchBegin
//
//  Created by Adoma's MacbookPro on 2017/4/18.
//  Copyright © 2017年 adoma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"ViewController %s",__func__);
}

@end
