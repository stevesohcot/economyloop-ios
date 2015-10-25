//
//  ViewController.m
//  Economy Loop
//
//  Created by Steve Sohcot on 10/23/15.
//  Copyright (c) 2015 Aeolic Ventures. All rights reserved.
//

#import "ViewController.h"
#import "webViewVC.h"
#import "SVProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Show loader
    [self performSelector:@selector(showLoader) withObject:nil afterDelay:0.1];
    
    //Load URL in webView
    NSURL *url = [NSURL URLWithString:@"http://app.economyloop.com/news"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView setScalesPageToFit:YES];
    self->webView.scrollView.bounces = NO;
    [self.webView loadRequest:request];

}

-(void)showLoader {
    [SVProgressHUD showWithStatus:@"Loading..."];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark webView Delegate
#pragma mark -

//Call when web view finish loading
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //Hide loading
    [SVProgressHUD dismiss];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //Get URL string
    NSString *strUrl = request.URL.absoluteString;
    
    //Flag Variable
    BOOL isRootURL = NO;
    
    //Check if its same domain
    if([strUrl rangeOfString:@"economyloop"].location != NSNotFound)
    {
        isRootURL = YES;
    }
    
    //Check if we clicked on web page and if domain is not same. Open in safari
    if (navigationType == UIWebViewNavigationTypeLinkClicked && isRootURL == NO){
        
        NSURL *url = request.URL;
        //[[UIApplication sharedApplication] openURL:url];
        [self presentView:url.absoluteString];
        return false;
    }
    
    return YES;
    
}

-(void)presentView:(NSString *)url {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    webViewVC *viewController = (webViewVC *)[storyboard instantiateViewControllerWithIdentifier:@"webView"];
    
    viewController.strURL = url;
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}

@end