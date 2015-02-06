//
//  ViewController.h
//  examOver
//
//  Created by 山本文子 on 2015/02/04.
//  Copyright (c) 2015年 山本文子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeRGB.h"

@interface ViewController : UIViewController<UIGestureRecognizerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIView * shitajiki;
    
    IBOutlet UIImageView * note;
}

-(void)panAction:(UIPanGestureRecognizer *)sender;

-(IBAction)cameraRoll;


@end

