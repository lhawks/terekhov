//
//  scetchViewController.m
//  terekhov
//
//  Created by lhawks on 30.11.13.
//  Copyright (c) 2013 lhawks. All rights reserved.
//

#import "scetchViewController.h"
#import "ScetchFullViewController.h"
@interface scetchViewController ()
@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;
- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;
@end

@implementation scetchViewController

@synthesize scrollViewS = _scrollViewS;
@synthesize pageControlS = _pageControlS;

@synthesize pageImages = _pageImages;
@synthesize pageViews = _pageViews;


- (void)loadVisiblePages {
    // First, determine which page is currently visible
    CGFloat pageWidth = self.scrollViewS.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollViewS.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    // Update the page control
    self.pageControlS.currentPage = page;
    
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
        self.nextBS.hidden = YES;
        self.backButtonS.hidden = NO;
        self.tapGestureScetch.enabled = NO;
        return;
    }

    self.tapGestureScetch.enabled = YES;
    // Load an individual page, first seeing if we've already loaded it
    UIView *pageView = [self.pageViews objectAtIndex:page];
    self.backButtonS.hidden = YES;
    if (page == 1){
        
        self.prevBS.hidden = YES;
    }
    else {
        self.nextBS.hidden = NO;
        self.prevBS.hidden = NO;
    }
    if ((NSNull*)pageView == [NSNull null]) {
        CGRect frame = self.scrollViewS.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollViewS addSubview:newPageView];
        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
        CGSize scrollableSize = CGSizeMake(self.scrollViewS.contentSize.width, 640);
        [_scrollViewS setContentSize:scrollableSize];
    }
    _imgS = [self.pageImages objectAtIndex:(self.pageControlS.currentPage)];
    _pageDestS = self.pageControlS.currentPage;
    
    
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


#pragma mark -

- (void)viewDidLoad {
    [_scetch setFont:[UIFont fontWithName:@"Futura New" size:16]];
    [_lookBook setFont:[UIFont fontWithName:@"Futura New" size:16]];
    [_springsummers setFont:[UIFont fontWithName:@"PT Serif" size:16]];
    [super viewDidLoad];
    //[_pageNe setFont:[UIFont fontWithName:@"PT Serif" size:10]];
    
    //self.title = @"Paged";
    if (_pageDest1 == 0) {
        // If it's outside the range of what we have to display, then do nothing
        self.nextBS.hidden = YES;
        self.backButtonS.hidden = NO;
        
        
    }
   // self.pageNe.hidden = NO;
    
    // Load an individual page, first seeing if we've already loaded it
    self.backButtonS.hidden = YES;
    if (_pageDest1 == 1){
        
        self.prevBS.hidden = YES;
    }
    else {
        self.nextBS.hidden = NO;
        self.prevBS.hidden = NO;
    }
    [self.scrollViewS setContentOffset:(CGPointMake(_pageDest1 * self.scrollViewS.frame.size.width, 0)) animated:YES];
    // Set up the image we want to scroll & zoom and add it to the scroll view
    self.pageImages = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"ss1.jpg"],
                       [UIImage imageNamed:@"ss2.jpg"],
                       [UIImage imageNamed:@"ss3.jpg"],
                       [UIImage imageNamed:@"ss4.jpg"],
                       [UIImage imageNamed:@"ss5.jpg"],
                       [UIImage imageNamed:@"ss6.jpg"],
                       [UIImage imageNamed:@"ss7.jpg"],
                       [UIImage imageNamed:@"ss8.jpg"],
                       [UIImage imageNamed:@"ss9.jpg"],
                       [UIImage imageNamed:@"frame.png"],
                       nil];
    
    NSInteger pageCount = self.pageImages.count;
    
    // Set up the page control
    self.pageControlS.currentPage = 0;
    self.pageControlS.numberOfPages = pageCount;
    
    // Set up the array to hold the views for each page
    self.pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Set up the content size of the scroll view
    CGSize pagesScrollViewSize = self.scrollViewS.frame.size;
    self.scrollViewS.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    
    // Load the initial set of pages that are on screen
    [self loadVisiblePages];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.scrollViewS = nil;
    self.pageControlS = nil;
    self.pageImages = nil;
    self.pageViews = nil;
    self.view = nil;
}

- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    self.scrollViewS = nil;
    self.pageControlS = nil;
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"zoomScetch"])
    {
        //NSArray *indexpaths = [self.collectionView indexPathsForSelectedItems];
        //[self setScrollViewOffset:self.scrollView.contentOffset];
        ScetchFullViewController *dest = [segue destinationViewController];
        dest.imgSs = _imgS;
        dest.pageBSs = _pageDestS;
        //dest.toImageSize = true;
        // imageName is a property of detail view controller
    }}

- (IBAction)nextPageS:(UIButton *)sender {
    NSInteger currentPage = self.pageControlS.currentPage + 1;
    CGPoint offset = CGPointMake(currentPage * self.scrollViewS.frame.size.width, 0);
    [self.scrollViewS setContentOffset:offset animated:YES];
}

- (IBAction)previousPageS:(UIButton *)sender {
    NSInteger currentPage = self.pageControlS.currentPage - 1;
    CGPoint offset = CGPointMake(currentPage * self.scrollViewS.frame.size.width, 0);
    [self.scrollViewS setContentOffset:offset animated:YES];
}

- (IBAction)backToTheTopS:(UIButton *)sender {
    NSInteger currentPage = self.pageControlS.currentPage - self.pageControlS.numberOfPages + 1;
    CGPoint offset = CGPointMake(currentPage * self.scrollViewS.frame.size.width, 0);
    [self.scrollViewS setContentOffset:offset animated:YES];
}


@end
