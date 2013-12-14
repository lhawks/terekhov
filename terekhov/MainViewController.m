//
//  MainViewController.m
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import "MainViewController.h"
#import "DAAutoScroll.h"
#import "CustomSegue.h"
@interface MainViewController ()
@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;
- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;
@end

@implementation MainViewController
@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize pageImages = _pageImages;
@synthesize pageViews = _pageViews;

- (void)loadVisiblePages {
    // First, determine which page is currently visible
    
        
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    // Update the page control
    self.pageControl.currentPage = page;
    
    // Work out which pages we want to load
    NSInteger firstPage = page - 1;
    NSInteger lastPage = page + 1;
    
    // Purge anything before the first page
    for (NSInteger i=0; i<firstPage; i++) {
        [self purgePage:i];
    }
    for (NSInteger i=firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
    }
}


- (void)loadPage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what we have to display, then do nothing
        return;
    }
    
    
    // Load an individual page, first seeing if we've already loaded it
    UIView *pageView = [self.pageViews objectAtIndex:page];
//    [UIView beginAnimations:@"*.jpg" context:nil];
//        //You need to set the pic name
//        
//        [UIView setAnimationDuration: 0.1];
//        _scrollView.alpha = 0.0f;
//        _scrollView.alpha = 1.0;
//        [UIView commitAnimations];
    
    if ((NSNull*)pageView == [NSNull null]) {
        CGRect frame = self.scrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollView addSubview:newPageView];
        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
    }
    
    [self.scrollView startScrolling];
    
}


- (void)purgePage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what we have to display, then do nothing
        return;
    }
    
    // Remove a page from the scroll view and reset the container array
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}


- (void)viewDidLoad
{

    [_textView setFont:[UIFont fontWithName:@"PT Serif" size:17]];
    [super viewDidLoad];
    //[_tapTo setFont:[UIFont fontWithName:@"Futura New" size:17]];
	// Do any additional setup after loading the view.
    //self.title = @"Paged";
    

 blinkTimer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(toggleButtonImage:) userInfo:nil repeats:YES];
    
    
        
    // Set up the image we want to scroll & zoom and add it to the scroll view
    self.pageImages = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"m1.jpg"],
                       [UIImage imageNamed:@"m3.jpg"],
                       [UIImage imageNamed:@"m4.jpg"],
                       [UIImage imageNamed:@"m5.jpg"],
                       [UIImage imageNamed:@"m7.jpg"],
                       [UIImage imageNamed:@"m8.jpg"],
                       [UIImage imageNamed:@"m9.jpg"],
                       [UIImage imageNamed:@"m11.jpg"],
                       [UIImage imageNamed:@"m12.jpg"],
                       [UIImage imageNamed:@"m13.jpg"],
                       [UIImage imageNamed:@"m14.jpg"],
                       [UIImage imageNamed:@"m15.jpg"],
                       [UIImage imageNamed:@"m17.jpg"],
                       [UIImage imageNamed:@"m18.jpg"],
                       [UIImage imageNamed:@"m19.jpg"],
                       [UIImage imageNamed:@"m21.jpg"],
                       [UIImage imageNamed:@"m24.jpg"],
                       nil];
    
    NSInteger pageCount = self.pageImages.count;
    
    // Set up the page control
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount;
    [UIView beginAnimations:@"terehov_logo_black.png" context:nil];
    [UIView setAnimationDuration: 3];
    _logoImg.alpha = 0.0f;
    _logoImg.alpha = 1.0;
    [UIView commitAnimations];
    [UIView beginAnimations:@"1.jpg" context:nil];
    //You need to set the pic name
    
    [UIView setAnimationDuration:3];
    _scrollView.alpha = 0.0f;
    _scrollView.alpha = 1.0;
    [UIView commitAnimations];
    
    // Set up the array to hold the views for each page
    self.pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    
}



- (void)toggleButtonImage:(NSTimer*)timer
{
    
    if(toggle)
    {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration: 2];
        _tapTo.alpha = 0.3f;
        _tapTo.alpha = 1.0;
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration: 2];
        _tapTo.alpha = 1.0;
        _tapTo.alpha = 0.3f;
        [UIView commitAnimations];
    }
    toggle = !toggle;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Set up the content size of the scroll view
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    
    // Load the initial set of pages that are on screen
    [self loadVisiblePages];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.scrollView = nil;
    self.pageControl = nil;
    self.pageImages = nil;
    self.pageViews = nil;
    
}
- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];

    self.scrollView = nil;
    self.pageControl = nil;
    self.pageImages = nil;
    self.pageViews = nil;
    
    // Dispose of any resources that can be recreated.
    
}
// Prepare for the segue going forward
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if([segue isKindOfClass:[CustomSegue class]]) {
//        // Set the start point for the animation to center of the button for the animation
//        ((CustomSegue *)segue).originatingPoint = _tapTo.center;
//    }
//}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages which are now on screen
    [self loadVisiblePages];
}


@end
