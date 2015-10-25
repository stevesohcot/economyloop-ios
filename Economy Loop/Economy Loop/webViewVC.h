//
//  webViewVC.h
//  Economy Loop
//
//  Created by Steve Sohcot on 10/23/15.
//  Copyright (c) 2015 Aeolic Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewVC : UIViewController

@property (nonatomic,strong) IBOutlet UIWebView *webView;

@property (nonatomic,strong) NSString *strURL;

-(IBAction)btnBackTapped:(id)sender;

@end
