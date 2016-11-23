//
//  AppDelegate.m
//  DWDURLProtocol
//
//  Created by dianwoda on 16/11/23.
//  Copyright © 2016年 dianwoda. All rights reserved.
//

#import "AppDelegate.h"
#import "DWDURLProtocol.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NSURLProtocol registerClass:[DWDURLProtocol class]];
    
    return YES;
}



@end
