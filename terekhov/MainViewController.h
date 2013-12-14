//
//  MainViewController.h
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import <UIKit/UIKit.h>


NSTimer *blinkTimer;
BOOL toggle;

@interface MainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIImageView *logoImg;
@property (strong, nonatomic) IBOutlet UIButton *tapTo;
@property (strong, nonatomic) IBOutlet UITextView *textView;


@property (assign, nonatomic)NSInteger index;
@end
