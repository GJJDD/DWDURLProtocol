//
//  DWDURLProtocol.m
//  DWDStastistics
//
//  Created by dianwoda on 16/11/2.
//  Copyright © 2016年 dianwoda. All rights reserved.
//


#import "DWDURLProtocol.h"
#import "NSString+DWDDevice.h"
#import "DWDAdFiltRuleManager.h"

static NSString * const DWDURLProtocolHandledKey = @"DWDURLProtocolHandledKey";

@interface DWDURLProtocol () <NSURLConnectionDelegate>

@property (nonatomic, strong) NSURLConnection *connection;


@end

@implementation DWDURLProtocol


+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    
    
    
    if ([NSURLProtocol propertyForKey:DWDURLProtocolHandledKey inRequest:request]) {
        return NO;
    }
    
    

    return YES;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)startLoading {
    // 124.160.194.11
    NSMutableURLRequest *newRequest = [self.request mutableCopy];
    [NSURLProtocol setProperty:@YES forKey:DWDURLProtocolHandledKey inRequest:newRequest];
    NSArray *ips = [NSString getDNSsWithDormain:newRequest.URL.host];
    NSArray *CUCC = [[DWDAdFiltRuleManager sharedInstance] adFiltDict][@"CUCC"]; // 联通
    NSArray *CMCC = [[DWDAdFiltRuleManager sharedInstance] adFiltDict][@"CMCC"]; // 移动
    NSArray *CTCC = [[DWDAdFiltRuleManager sharedInstance] adFiltDict][@"CTCC"]; // 电信
    for (int i = 0; i < CUCC.count; i++) {
        for (int j = 0; j <ips.count; j++) {
            if ([[NSString stringWithFormat:@"%@", ips[j]] containsString:CUCC[i]]) {
                return;
            }
        }
    }
    for (int i = 0; i < CMCC.count; i++) {
        for (int j = 0; j <ips.count; j++) {
            if ([[NSString stringWithFormat:@"%@", ips[j]] containsString:CMCC[i]]) {
                return;
            }
        }
    }
    for (int i = 0; i < CTCC.count; i++) {
        for (int j = 0; j <ips.count; j++) {
            if ([[NSString stringWithFormat:@"%@", ips[j]] containsString:CTCC[i]]) {
                return;
            }
        }
    }
    
    [NSURLSession sharedSession];
    
    self.connection = [NSURLConnection connectionWithRequest:newRequest delegate:self];
    
}

- (void)stopLoading {
    [self.connection cancel];
}


#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // 统计状态码和请求链接

    
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.client URLProtocol:self didLoadData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.client URLProtocolDidFinishLoading:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    
    
    [self.client URLProtocol:self didFailWithError:error];
}



@end
