//
//  webViewVC.m
//  Economy Loop
//
//  Created by Steve Sohcot on 10/23/15.
//  Copyright (c) 2015 Aeolic Ventures. All rights reserved.
//

#import "webViewVC.h"

@interface webViewVC ()

@end

@implementation webViewVC
@synthesize webView;
@synthesize strURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Load URL in webView
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView setScalesPageToFit:YES];
    self->webView.scrollView.bounces = NO;
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnBackTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
