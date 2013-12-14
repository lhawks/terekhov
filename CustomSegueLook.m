//
//  CustomSegueLook.m
//  terekhov
//
//  Created by lhawks on 04.12.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import "CustomSegueLook.h"

@implementation CustomSegueLook
- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    
    [sourceViewController.view addSubview:destinationViewController.view];
    //sourceViewController.view.transform = CGAffineTransformMakeTranslation(0, 0);
    destinationViewController.view.transform = CGAffineTransformMakeTranslation(768, 0);
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         //[sourceViewController.view addSubview:destinationViewController.view];
                         sourceViewController.view.transform = CGAffineTransformMakeTranslation(-768, 0);
                         
                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview];
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                     } ];
}
@end
