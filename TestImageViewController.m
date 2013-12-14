//
//  TestImageViewController.m
//  terekhov
//
//  Created by lhawks on 05.12.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import "TestImageViewController.h"
#import "lookbookViewController.h"
@interface TestImageViewController ()
@property (nonatomic, strong) UIImageView *ImageView;

- (void)centerScrollViewContents;
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;

@end

@implementation TestImageViewController

@synthesize scrollviewZoom = _scrollviewZoom;



@synthesize ImageView = _ImageView;



- (void)centerScrollViewContents {
    
    CGSize boundsSize = self.scrollviewZoom.bounds.size;
    
    CGRect contentsFrame = self.ImageView.frame;
    
    
    
    if (contentsFrame.size.width < boundsSize.width) {
        
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
        
    } else {
        
        contentsFrame.origin.x = 0.0f;
        
    }
    
    
    
    if (contentsFrame.size.height < boundsSize.height) {
        
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
        
    } else {
        
        contentsFrame.origin.y = 0.0f;
        
    }
    
    
    
    
    
    self.ImageView.frame = contentsFrame;
    
}



- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
    
    // Get the location within the image view where we tapped
    
    CGPoint pointInView = [recognizer locationInView:self.ImageView];
    
    
    
    // Get a zoom scale that's zoomed in slightly, capped at the maximum zoom scale specified by the scroll view
    
    CGFloat newZoomScale = self.scrollviewZoom.zoomScale * 1.5f;
    
    newZoomScale = MIN(newZoomScale, self.scrollviewZoom.maximumZoomScale);
    
    
    
    // Figure out the rect we want to zoom to, then zoom to it
    
    CGSize scrollViewSize = self.scrollviewZoom.bounds.size;
    
    
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    
    CGFloat h = scrollViewSize.height / newZoomScale;
    
    CGFloat x = pointInView.x - (w / 2.0f);
    
    CGFloat y = pointInView.y - (h / 2.0f);
    
    
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    
    
    [self.scrollviewZoom zoomToRect:rectToZoomTo animated:YES];
    
}

- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer {
    
    // Zoom out slightly, capping at the minimum zoom scale specified by the scroll view
    
    CGFloat newZoomScale = self.scrollviewZoom.zoomScale / 1.5f;
    
    newZoomScale = MAX(newZoomScale, self.scrollviewZoom.minimumZoomScale);
    
    [self.scrollviewZoom setZoomScale:newZoomScale animated:YES];
    
}

- (void)viewDidLoad

{
    
    [super viewDidLoad];
    
    
    
    
    
    
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"l%ld.jpg", (_pageB+1)]];
    [UIView beginAnimations:[NSString stringWithFormat:@"l%ld.jpg", (_pageB+1)] context:nil];
    
    self.imageView = [[UIImageView alloc] initWithImage:image];
    [UIView setAnimationDuration: 1];
    [UIView setAnimationDelay:0.9];
    _ImageView.alpha = 0.0f;
    _ImageView.alpha = 1.0;
    [UIView commitAnimations];
    
    self.ImageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=image.size};
    
    [self.scrollviewZoom addSubview:self.ImageView];
    // Tell the scroll view the size of the contents
    self.scrollviewZoom.contentSize = CGSizeMake(750.0, 600.0);//_img.size;
    
    
    
    
    
    
    
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
    
    doubleTapRecognizer.numberOfTapsRequired = 2;
    
    doubleTapRecognizer.numberOfTouchesRequired = 1;
    
    [self.scrollviewZoom addGestureRecognizer:doubleTapRecognizer];
    
    
    
    UITapGestureRecognizer *twoFingerTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTwoFingerTapped:)];
    
    twoFingerTapRecognizer.numberOfTapsRequired = 1;
    
    twoFingerTapRecognizer.numberOfTouchesRequired = 2;
    
    [self.scrollviewZoom addGestureRecognizer:twoFingerTapRecognizer];
    
}



- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
    
    // Set up the minimum & maximum zoom scales
    
    CGRect scrollViewFrame = self.scrollviewZoom.frame;
    
    CGFloat scaleWidth = (scrollViewFrame.size.width) / self.scrollviewZoom.contentSize.width;
    
    CGFloat scaleHeight = (scrollViewFrame.size.height) / self.scrollviewZoom.contentSize.height;
    
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    
    
    self.scrollviewZoom.minimumZoomScale = minScale;
    
    self.scrollviewZoom.maximumZoomScale = 1.0f;
    
    self.scrollviewZoom.zoomScale = minScale;
    
    
    
    [self centerScrollViewContents];
    
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    // Return the view that we want to zoom
    
    return self.ImageView;
    
}



- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    // The scroll view has zoomed, so we need to re-center the contents
    
    [self centerScrollViewContents];
    
}

- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}
-(void)viewDidUnload {
    self.view = nil;
    self.ImageView = nil;
    self.img = nil;
    self.scrollviewZoom = nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    
    //NSArray *indexpaths = [self.collectionView indexPathsForSelectedItems];
    
    lookbookViewController *dest = [segue destinationViewController];
    
    //dest.img = _img;
    
    dest.pageDest1 = _pageB;
    
    dest.backFromFullView = true;
    //[dest.scrollView setContentOffset:(CGPointMake(dest.pageDest1 * dest.scrollView.frame.size.width, 0)) animated:YES];
    
    // imageName is a property of detail view controller
    
}
@end
