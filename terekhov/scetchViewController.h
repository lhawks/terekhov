//
//  scetchViewController.h
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scetchViewController : UIViewController
@property (nonatomic) BOOL backFromFullView;
@property (nonatomic, strong) UIImage* imgS;
@property (nonatomic) NSInteger pageDestS;
@property (nonatomic) NSInteger pageDest1;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureScetch;
@property (strong, nonatomic) IBOutlet UITextView *springsummers;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewS;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControlS;
@property (strong, nonatomic) IBOutlet UIButton *nextBS;
@property (strong, nonatomic) IBOutlet UIButton *prevBS;
@property (strong, nonatomic) IBOutlet UIButton *backButtonS;
@property (assign, nonatomic)NSInteger indexS;
@property (strong, nonatomic) IBOutlet UILabel *scetch;
@property (strong, nonatomic) IBOutlet UILabel *lookBook;

- (IBAction)nextPageS:(UIButton *)sender;
- (IBAction)previousPageS:(UIButton *)sender;
- (IBAction)backToTheTopS:(UIButton *)sender;


@end
