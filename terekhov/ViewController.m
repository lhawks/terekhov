//
//  ViewController.m
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
@interface ViewController ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController
@synthesize timer=_timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_lbDays setFont:[UIFont fontWithName:@"Futura New" size:21]];
    [_lbHours setFont:[UIFont fontWithName:@"Futura New" size:21]];
    [_lbMinutes setFont:[UIFont fontWithName:@"Futura New" size:21]];
    self.lbDays.hidden = YES;
    self.lbHours.hidden = YES;
    self.lbMinutes.hidden =YES;
    blinkTimer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(toggleButtonImage:) userInfo:nil repeats:YES];
}

-(void) viewWillAppear:(BOOL)animated
{
    _timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats: YES];
    
}

-(void) updateCountdown
{
    
    NSString *dateString = @"16-12-2013";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *dateFromString = [[NSDate alloc] init];
    // voila!
    dateFromString = [dateFormatter dateFromString:dateString];
    
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    
    
    NSDateComponents *componentsHours = [calendar components:NSHourCalendarUnit fromDate:now];
    NSDateComponents *componentMint = [calendar components:NSMinuteCalendarUnit fromDate:now];
    //NSDateComponents *componentSec = [calendar components:NSSecondCalendarUnit fromDate:now];
    
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *componentsDaysDiff = [gregorianCalendar components:NSDayCalendarUnit
                                                                fromDate:now
                                                                  toDate:dateFromString
                                                                 options:0];
    
    if (componentsDaysDiff.day < 0 ) {
        
        MainViewController *NVC = [self.storyboard instantiateViewControllerWithIdentifier:@"YourViewControllerIdentifier"];
        //[self presentViewController:NVC animated:NO completion:nil];
        [self presentViewController:NVC animated:YES completion:nil];
    } else {

        self.lbDays.hidden = NO;
        self.lbHours.hidden = NO;
        self.lbMinutes.hidden =NO;
        self.lbDays.text=[NSString stringWithFormat:@"%02ldD",(long)componentsDaysDiff.day];
        self.lbHours.text=[NSString stringWithFormat:@"%02ldH",(24-componentsHours.hour)];
        self.lbMinutes.text=[NSString stringWithFormat:@"%02ldM",(60-componentMint.minute)];
    }
    
}

- (void)toggleButtonImage:(NSTimer*)timer
{
    
    if(toggle)
    {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration: 2];
        _seconds.alpha = 0.0f;
        _seconds.alpha = 1.0;
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration: 2];
        _seconds.alpha = 1.0;
        _seconds.alpha = 0.0f;
        [UIView commitAnimations];
    }
    toggle = !toggle;
    
}

@end
