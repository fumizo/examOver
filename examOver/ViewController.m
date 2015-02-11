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
//    shitajiki.image = [UIImage imageNamed:@"shitajiki.png"];
    
    shitajiki.backgroundColor = [ChangeRGB changeRGB:@"#ff0000" alpha:0.91];
    shitajiki.alpha = 0.9;
    [self.view addSubview:shitajiki];
    
    //    ドラッグジェスチャーをブラックビュー登録する
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [shitajiki addGestureRecognizer:pan];
    
    [note setContentMode:UIViewContentModeScaleAspectFit]; //画像が伸びないようにする
    
    // ピンチジェスチャーを登録する
    UIPinchGestureRecognizer *pinch = [[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)] autorelease];
    [self.view addGestureRecognizer:pinch];
}

//ジェスチャーの同時処理を許可
- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
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

// ピンチジェスチャー発生時に呼び出されように設定したメソッド。
// ピンチジェスチャー中に何度も呼び出される。
- (void)pinchAction : (UIPinchGestureRecognizer *)sender {
    
    // ピンチジェスチャー発生時に、Imageの現在のアフィン変形の状態を保存する
    if (sender.state == UIGestureRecognizerStateBegan) {
        currentTransForm = note.transform;
        // currentTransFormは、フィールド変数。imgViewは画像を表示するUIImageView型のフィールド変数。
    }
    
    // ピンチジェスチャー発生時から、どれだけ拡大率が変化したかを取得する
    // 2本の指の距離が離れた場合には、1以上の値、近づいた場合には、1以下の値が取得できる
    CGFloat scale = [sender scale];
    
    // ピンチジェスチャー開始時からの拡大率の変化を、imgViewのアフィン変形の状態に設定する事で、拡大する。
    note.transform = CGAffineTransformConcat(currentTransForm, CGAffineTransformMakeScale(scale, scale));
    
}

-(IBAction)cameraRoll{
    
    //UIImagePickerControllerを初期化・生成
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    //画像の取得先をカメラロールに設定する
    [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //デリゲートの設定
    [ipc setDelegate:self];
    [ipc setAllowsEditing:YES];
    //カメラロールをモーダルビューとして表示する
    [self presentViewController:ipc animated:YES completion:nil];
    /*
    UIImagePickerController *imgPic = [[UIImagePickerController alloc]init];
    imgPic.delegate = self;
    [imgPic setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController: imgPic animated:YES completion:nil];
    */
}

/*
- (void)imagePickerController :(UIImagePickerController *)picker
        didFinishPickingImage :(UIImage *)image editingInfo :(NSDictionary *)editingInfo {
    // 読み込んだ画像表示
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:iv];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
*/
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [note setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
