//
//  ECSDBViewController.m
//  DirectionBoard
//
//  Created by Rameshkumar Mookkan on 28/03/14.
//  Copyright (c) 2014 ECSoftwareTak. All rights reserved.
//

#import "ECSDBViewController.h"

@interface ECSDBViewController ()

@end

@implementation ECSDBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    pgr.delegate = self;
    [img_direction addGestureRecognizer:pgr];
    
    UIImage *image = [UIImage imageNamed:@"Color-Splash-640x960.jpg"];
    UIImage *imgWithRect = [self imageByDrawingCircleOnImage:image];
    UIImageView *imgView=[[UIImageView alloc] initWithImage:imgWithRect];
    [imgView setFrame:self.view.frame];
    [self.view addSubview:imgView];
}

- (UIImage *)imageByDrawingCircleOnImage:(UIImage *)image
{
    float strokeWidth=2.0f;
    UIGraphicsBeginImageContext(image.size);
    
    [image drawAtPoint:CGPointZero];
    CGRect rectangle = CGRectMake(200, 220, 50, 50);
    
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIImage *lImg=[self gradientImageWithSize:CGSizeMake(strokeWidth, rectangle.size.height)];
    UIImage *tImg=[self gradientImageWithSize:CGSizeMake(rectangle.size.height, strokeWidth)];
    UIImage *rImg=[self gradientImageWithSize:CGSizeMake(strokeWidth, rectangle.size.height)];
    UIImage *bImg=[self gradientImageWithSize:CGSizeMake(rectangle.size.width, strokeWidth)];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    [retImage drawAtPoint:CGPointMake(0, 0)];
    [lImg drawAtPoint:CGPointMake(rectangle.origin.x, rectangle.origin.y)];
    [tImg drawAtPoint:CGPointMake(rectangle.origin.x+strokeWidth, rectangle.origin.y)];
    [rImg drawAtPoint:CGPointMake(rectangle.origin.x+rectangle.size.width,rectangle.origin.y+strokeWidth)];
    [bImg drawAtPoint:CGPointMake(rectangle.origin.x, rectangle.origin.y+rectangle.size.height)];
    
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
    
    return retImage;
}


- (UIImage *)gradientImageWithSize:(CGSize)size
{
    CGSize textSize = CGSizeMake(size.width, size.height);
    CGFloat width = textSize.width;
    CGFloat height = textSize.height;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIGraphicsPushContext(context);
    
    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    
    CGFloat components[8] = { 0.0, 1.0, 1.0, 1.0,  // Start color
        1.0, 1.0, 0.0, 1.0 }; // End color
    
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
    
    CGPoint topCenter = CGPointMake(0, 0);
    CGPoint bottomCenter = CGPointMake(0, textSize.height);
    
    CGContextDrawLinearGradient(context, glossGradient, topCenter, bottomCenter, 0);
    
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace);
    
    // pop context
    UIGraphicsPopContext();
    
    // get a UIImage from the image context
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return gradientImage;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"tap detected.");
    // Get the location of the touch
    CGPoint touchPoint = [recognizer locationOfTouch:0 inView:[self view]];
    NSLog(@"x = %f y = %f", touchPoint.x, touchPoint.y );
    UIAlertView *avSection = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"Food court"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    
    if(touchPoint.y > 242 && touchPoint.y <=249 && touchPoint.x > 203 & touchPoint.x <245)
    {
        avSection.message = @"WOW...FoodCourt!";
        [avSection show];
    }
    else if(touchPoint.y > 248 && touchPoint.y <=255 && touchPoint.x > 201 & touchPoint.x <244)
    {
        avSection.message = @"WOW...ATM";
        [avSection show];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
