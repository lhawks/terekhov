//
//  MenuViewController.m
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [_scetch setFont:[UIFont fontWithName:@"Futura New" size:16]];
    [_lookBook setFont:[UIFont fontWithName:@"Futura New" size:16]];
    [_spingsummer setFont:[UIFont fontWithName:@"PT Serif" size:16]];
//    [_year setFont:[UIFont fontWithName:@"PT Serif" size:12]];
//    [_tilda setFont:[UIFont fontWithName:@"Futura New" size:13]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
    
}
@end
