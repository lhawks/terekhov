//
//  lookbookViewController.h
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import <UIKit/UIKit.h>
UITapGestureRecognizer *tap;


CGRect prevFrame;
@interface lookbookViewController : UIViewController<UIGestureRecognizerDelegate>
    
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) IBOutlet UITextView *springsummerl;
@property (strong, nonatomic) IBOutlet UILabel *eskizi;
@property (strong, nonatomic) IBOutlet UILabel *lookbook1;

@property (nonatomic) BOOL backFromFullView;
@property (nonatomic, strong) UIImage* img;
@property (nonatomic) NSInteger pageDest;
@property (nonatomic) NSInteger pageDest1;

@property (nonatomic) CGPoint scrollViewContentOffset;
//- (IBAction)TapToFullScreen:(UITapGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIButton *nextB;
@property (strong, nonatomic) IBOutlet UIButton *prevB;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (assign, nonatomic)NSInteger index;
- (IBAction)nextPage:(UIButton *)sender;
- (IBAction)previousPage:(UIButton *)sender;
- (IBAction)backToTheTop:(UIButton *)sender;


@end
