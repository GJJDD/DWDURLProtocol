//
//  ViewController.m
//  DWDURLProtocol
//
//  Created by dianwoda on 16/11/23.
//  Copyright © 2016年 dianwoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://m.news.baidu.com/news?fr=mohome&ssid=0&from=&uid=&pu=sz%401320_2001%2Cta%40iphone_1_10.0_3_602&bd_page_type=1#/newslist/widthNav/baijia/%E7%99%BE%E5%AE%B6?_k=hnzrd8"]]];

}



@end
