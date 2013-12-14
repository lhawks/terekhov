//
//  TestImageViewController.h
//  terekhov
//
//  Created by lhawks on 05.12.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestImageViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollviewZoom;

@property(nonatomic) UIImage *img;
@property(nonatomic) NSInteger pageB;
@property(nonatomic) BOOL toImageSize;
@end
