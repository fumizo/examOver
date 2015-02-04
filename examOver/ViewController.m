//
//  ViewController.m
//  examOver
//
//  Created by 山本文子 on 2015/02/04.
//  Copyright (c) 2015年 山本文子. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    shitajiki = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 270, 300)];
    
    shitajiki.backgroundColor = [UIColor orangeColor];
    shitajiki.alpha = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
