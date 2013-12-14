//
//  ScetchFullViewController.h
//  terekhov
//
//  Created by lhawks on 07.12.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScetchFullViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollviewZoomScetch;
@property(nonatomic) UIImage *imgSs;
@property(nonatomic) NSInteger pageBSs;

@end
