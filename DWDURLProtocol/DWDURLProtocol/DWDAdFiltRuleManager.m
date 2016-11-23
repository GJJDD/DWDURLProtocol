//
//  DWDAdFiltRuleManager.m
//  DWDStastistics
//
//  Created by dianwoda on 16/11/2.
//  Copyright © 2016年 dianwoda. All rights reserved.
//

#import "DWDAdFiltRuleManager.h"
#import "DWDURLProtocol.h"

static DWDAdFiltRuleManager *adFiltRuleManager = nil;
@implementation DWDAdFiltRuleManager

+ (instancetype)sharedInstance
{
    @synchronized(self){
        if (!adFiltRuleManager){
            adFiltRuleManager = [[DWDAdFiltRuleManager alloc] init];
            [NSURLProtocol registerClass:[DWDURLProtocol class]];
        }
    }
    return adFiltRuleManager;
}

- (void)setAdFiltRuleUrl:(NSString *)adFiltRuleUrl
{
    _adFiltRuleUrl = adFiltRuleUrl;
    _adFiltDict = [NSDictionary dictionaryWithContentsOfURL:[NSURL URLWithString:_adFiltRuleUrl]];
    if (!_adFiltDict) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"adFilt" ofType:@"plist"];
        _adFiltDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    }

}


@end
