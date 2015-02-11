//
//  ViewController.h
//  examOver
//
//  Created by 山本文子 on 2015/02/04.
//  Copyright (c) 2015年 山本文子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeRGB.h"

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIGestureRecognizerDelegate>{
    UIView * shitajiki;
    
    IBOutlet UIImageView * note;
    
    CGAffineTransform currentTransForm;
}

-(void)panAction:(UIPanGestureRecognizer *)sender;
-(void)pinchAction:(UIPinchGestureRecognizer *)sender;

-(IBAction)cameraRoll;


@end

