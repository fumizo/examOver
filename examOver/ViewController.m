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
    shitajiki.alpha = 0.5;
    [self.view addSubview:shitajiki];
    
    //    ドラッグジェスチャーをブラックビュー登録する
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [shitajiki addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)panAction:(UIPanGestureRecognizer *)sender{
    
    //    移動した距離の所得
    CGPoint p =[sender translationInView:self.view];
    //    移動した距離のx,yをブラックビューの中心点に指定
    CGPoint movedPoint = CGPointMake(shitajiki.center.x+p.x, shitajiki.center.y + p.y);
    shitajiki.center =movedPoint;

    
    NSLog(@"*座標%@を移動中...*", NSStringFromCGPoint(movedPoint));
    //    pは構造体！文字列としてnslogする１
    
    //    移動した距離を初期かする
    [sender setTranslation:CGPointZero inView:self.view];
    
}


@end
