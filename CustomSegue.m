//
//  CustomSegue.m
//  terekhov
//
//  Created by lhawks on 03.12.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue
//-(void)perform{
//    UIViewController *dst = [self destinationViewController];
//    UIViewController *src = [self sourceViewController];
//    [dst viewWillAppear:NO];
//    [dst viewDidAppear:NO];
//    
//    //[src retain];
//    
//    [src.view addSubview:dst.view];
//    
//    CGRect original = dst.view.frame;
//    
//    dst.view.frame = CGRectMake(dst.view.frame.origin.x,dst.view.frame.size.height, dst.view.frame.size.width, dst.view.frame.size.height);
//    //dst.view.frame = CGRectMake(dst.view.frame.origin.x, dst.view.frame.size.height, dst.view.frame.size.width, 0-dst.view.frame.size.height);
//    
//    //[UIView beginAnimations:nil context:nil];
//    [UIView animateWithDuration:1.0
//                     animations:^{
//                         dst.view.frame = CGRectMake(original.origin.x, original.origin.y, original.size.height, original.size.width);}];
//                         
//                         //[UIView commitAnimations];
//    
//    [self performSelector:@selector(animationDone:) withObject:dst afterDelay:1.17f];
//}

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
 
    
    [sourceViewController.view addSubview:destinationViewController.view];
    //sourceViewController.view.transform = CGAffineTransformMakeTranslation(0, 0);
    destinationViewController.view.transform = CGAffineTransformMakeTranslation(0, 1024);
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         //[sourceViewController.view addSubview:destinationViewController.view];
                         sourceViewController.view.transform = CGAffineTransformMakeTranslation(0, -1024);
                         
                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview];
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                     }
     ];

//    [UIView transitionWithView:sourceViewController.navigationController.view duration:0.5
//                       options:UIViewAnimationOptionBeginFromCurrentState
//                    animations:^{
//                        [sourceViewController.navigationController pushViewController:destinationViewController animated:NO];
//                    }
//                    completion:NULL];
    
//    // Add the destination view as a subview, temporarily
//    [sourceViewController.view addSubview:destinationViewController.view];
//    
//    // Transformation start scale
//    destinationViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05);
//    
//    // Store original centre point of the destination view
//    CGPoint originalCenter = destinationViewController.view.center;
//    // Set center to start point of the button
//    destinationViewController.view.center = self.originatingPoint;
//    
//    [UIView animateWithDuration:0.5
//                          delay:0.0
//                        options:UIViewAnimationOptionCurveEaseInOut
//                     animations:^{
//                         // Grow!
//                         destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
//                         destinationViewController.view.center = originalCenter;
//                     }
//                     completion:^(BOOL finished){
//                         [destinationViewController.view removeFromSuperview]; // remove from temp super view
//                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL]; // present VC
//                     }];
//}
//- (void)animationDone:(id)vc{
//    UIViewController *dst = (UIViewController*)vc;
//    UINavigationController *nav = [[self sourceViewController] navigationController];
//    [nav popViewControllerAnimated:NO];
//    [nav pushViewController:dst animated:NO];
//    //[[self sourceViewController] release];
}
@end
