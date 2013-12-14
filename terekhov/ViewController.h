//
//  ViewController.h
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import <UIKit/UIKit.h>
NSTimer *blinkTimer;
BOOL toggle;
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lbDays;
@property (strong, nonatomic) IBOutlet UILabel *lbHours;
@property (strong, nonatomic) IBOutlet UILabel *lbMinutes;
@property (strong, nonatomic) IBOutlet UIImageView *seconds;

@end
