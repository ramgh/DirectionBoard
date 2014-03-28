//
//  ECSDBViewController.h
//  DirectionBoard
//
//  Created by Rameshkumar Mookkan on 28/03/14.
//  Copyright (c) 2014 ECSoftwareTak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ECSDBViewController : UIViewController <UIGestureRecognizerDelegate> {
    IBOutlet UIImageView *img_direction;
    IBOutlet UIPanGestureRecognizer *panGesture;
}

@end
