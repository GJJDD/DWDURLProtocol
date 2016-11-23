//
//  DWDAdFiltRuleManager.h
//  DWDStastistics
//
//  Created by dianwoda on 16/11/2.
//  Copyright © 2016年 dianwoda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWDAdFiltRuleManager : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic, copy) NSString *adFiltRuleUrl;
@property (nonatomic, strong) NSDictionary *adFiltDict;
@end
