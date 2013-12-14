//
//  lookbookViewController.m
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import "lookbookViewController.h"
#import "TestImageViewController.h"

@interface lookbookViewController ()
@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;


- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;
@end
@implementation lookbookViewController
@synthesize scrollViewContentOffset;
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
        self.nextB.hidden = YES;
        self.backButton.hidden = NO;
        self.tapGesture.enabled = NO;
        return;
    }
    self.tapGesture.enabled = YES;
    
    // Load an individual page, first seeing if we've already loaded it
    UIView *pageView = [self.pageViews objectAtIndex:page];
    self.backButton.hidden = YES;
    if (page == 1){
        
        self.prevB.hidden = YES;
    }
    else {
        self.nextB.hidden = NO;
        self.prevB.hidden = NO;
    }
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
    _img = [self.pageImages objectAtIndex:(self.pageControl.currentPage)];
    _pageDest = self.pageControl.currentPage;
    //_backFromFullView = false;
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
    //_backFromFullView = false;
}


#pragma mark -

- (void)viewDidLoad {
    

    
    [_eskizi setFont:[UIFont fontWithName:@"Futura New" size:16]];
    [_lookbook1 setFont:[UIFont fontWithName:@"Futura New" size:16]];
    [_springsummerl setFont:[UIFont fontWithName:@"PT Serif" size:16]];
    [super viewDidLoad];
    
    
    if (_pageDest1 < 0 || _pageDest1 >= 28) {
        // If it's outside the range of what we have to display, then do nothing
        self.nextB.hidden = YES;
        self.backButton.hidden = NO;
        
        
    }
    
    
    // Load an individual page, first seeing if we've already loaded it
    
    self.backButton.hidden = YES;
    if (_pageDest1 == 1){
        
        self.prevB.hidden = YES;
    }
    else {
        self.nextB.hidden = NO;
        self.prevB.hidden = NO;
    }
    [self.scrollView setContentOffset:(CGPointMake(_pageDest1 * self.scrollView.frame.size.width, 0)) animated:YES];

    //isFullScreen = false;
    //tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgToFullScreen)];
    //tap.delegate = self;
    //self.title = @"Paged";
    
    // Set up the image we want to scroll & zoom and add it to the scroll view
    self.pageImages = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"1.jpg"],
                       [UIImage imageNamed:@"2.jpg"],
                       [UIImage imageNamed:@"3.jpg"],
                       [UIImage imageNamed:@"4.jpg"],
                       [UIImage imageNamed:@"5.jpg"],
                       [UIImage imageNamed:@"6.jpg"],
                       [UIImage imageNamed:@"7.jpg"],
                       [UIImage imageNamed:@"8.jpg"],
                       [UIImage imageNamed:@"9.jpg"],
                       [UIImage imageNamed:@"10.jpg"],
                       [UIImage imageNamed:@"11.jpg"],
                       [UIImage imageNamed:@"12.jpg"],
                       [UIImage imageNamed:@"13.jpg"],
                       [UIImage imageNamed:@"14.jpg"],
                       [UIImage imageNamed:@"15.jpg"],
                       [UIImage imageNamed:@"16.jpg"],
                       [UIImage imageNamed:@"17.jpg"],
                       [UIImage imageNamed:@"18.jpg"],
                       [UIImage imageNamed:@"19.jpg"],
                       [UIImage imageNamed:@"20.jpg"],
                       [UIImage imageNamed:@"21.jpg"],
                       [UIImage imageNamed:@"22.jpg"],
                       [UIImage imageNamed:@"23.jpg"],
                       [UIImage imageNamed:@"24.jpg"],
                       [UIImage imageNamed:@"25.jpg"],
                       [UIImage imageNamed:@"26.jpg"],
                       [UIImage imageNamed:@"27.jpg"],
                       [UIImage imageNamed:@"frame.png"],
                       nil];
    
    NSInteger pageCount = self.pageImages.count;
    
    // Set up the page control
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount;
    
    // Set up the array to hold the views for each page
    self.pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    // Set up the content size of the scroll view
    //[self.scrollView setContentOffset:(CGPointMake(_pageDest1 * self.scrollView.frame.size.width, 0)) animated:YES];
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    
    // Load the initial set of pages that are on screen
    [self loadVisiblePages];
}
- (void)viewBeforeLoad{
    _backFromFullView = false;
}
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.scrollView = nil;
    self.pageControl = nil;
    self.pageImages = nil;
    self.pageViews = nil;
    self.view = nil;
}

- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    self.scrollView = nil;
    self.pageControl = nil;
    self.pageImages = nil;
    self.pageViews = nil;
    self.view = nil;
    
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages which are now on screen
    [self loadVisiblePages];
}



//
//-(void)imgToFullScreen{
//    if (!isFullScreen) {
//        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
//            //save previous frame
//            prevFrame = _scrollView.frame;
//            [self.scrollView setFrame:[[UIScreen mainScreen] bounds]];
//        }completion:^(BOOL finished){
//            isFullScreen = true;
//        }];
//        return;
//    }
//    else{
//        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
//            [_scrollView setFrame:prevFrame];
//        }completion:^(BOOL finished){
//            isFullScreen = false;
//        }];
//        return;
//    }}

//
//- (void)tapOnce:(UIGestureRecognizer *)gesture
//{
//    //on a single  tap, call zoomToRect in UIScrollView
//    [self.scrollView zoomToRect:CGRectMake(190, 190, 100, 100) animated:NO];
//}
//- (void)tapTwice:(UIGestureRecognizer *)gesture
//{
//    //on a double tap, call zoomToRect in UIScrollView
//    [self.scrollView zoomToRect:CGRectMake(190, 190, 100, 100) animated:NO];
//}


- (IBAction)nextPage:(UIButton *)sender {
    NSInteger currentPage = self.pageControl.currentPage + 1;
    CGPoint offset = CGPointMake(currentPage * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (IBAction)previousPage:(UIButton *)sender {
    NSInteger currentPage = self.pageControl.currentPage - 1;
    CGPoint offset = CGPointMake(currentPage * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (IBAction)backToTheTop:(UIButton *)sender {
    NSInteger currentPage = self.pageControl.currentPage - self.pageControl.numberOfPages + 1;
    CGPoint offset = CGPointMake(currentPage * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:YES];

}


//- (void)viewDidDisappear:(BOOL)animated { scrollViewContentOffset = _scrollView.contentOffset; }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"zoom"])
    {
        
        //NSArray *indexpaths = [self.collectionView indexPathsForSelectedItems];
        //[self setScrollViewOffset:self.scrollView.contentOffset];
        TestImageViewController *dest = [segue destinationViewController];
        dest.img = _img;
        dest.pageB = _pageDest;
        //dest.toImageSize = true;
        // imageName is a property of detail view controller
    }}

//- (IBAction)TapToFullScreen:(UITapGestureRecognizer *)sender {
//    if (!isFullScreen) {
//        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
//            //save previous frame
//            prevFrame = self.scrollView.frame;
//            [self.scrollView setFrame:[[UIScreen mainScreen] bounds]];
//            self.scrollView.contentSize = CGSizeMake(1024,720);
//        }completion:^(BOOL finished){
//            isFullScreen = true;
//        }];
//        return;
//    }
//    else{
//        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
//            [_scrollView setFrame:prevFrame];
//        }completion:^(BOOL finished){
//            isFullScreen = false;
//        }];
//        return;
//    }
//}
@end
