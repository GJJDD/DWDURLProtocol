//
//  NSString+DWDDevice.h
//  DWDStastistics
//
//  Created by dianwoda on 16/10/28.
//  Copyright © 2016年 dianwoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (DWDDevice)
// 屏幕分辨率
+ (NSString *)screenScale;
// 设备版本号
+ (NSString *)deviceVersion;
// wifi名称
+ (NSString *)wifiName;
// 网络类型
+ (NSString *)networktype;
// 运营商信息
+ (NSString *)getcarrierName;
// 电量
+ (NSString *)getCurrentBatteryLevel;
// 内存使用情况描述
+ (NSString *)memorySize;
// 磁盘使用情况描述
+ (NSString *)diskSize;
// 是否越狱
+ (NSString *)jailBreak;
// 使用内存大小计算
+ (NSString *)usedMemorySize;
// 设备型号
+ (NSString *)platform;
// 获得document 路径
+ (NSString *)documentPath:(NSString *)fileName;
// 创建文件夹
+ (void)fileName:(NSString *)filePath;
// 获取当前设备ip地址
+ (NSString *)deviceIPAdress;
// 获取当前设备网关地址
+ (NSString *)getGatewayIPAddress;
// 通过域名获取服务器DNS地址
+ (NSArray *)getDNSsWithDormain:(NSString *)hostName;
// 格式化IPV6地址
+(NSString *)formatIPV6Address:(struct in6_addr)ipv6Addr;
+ (UIViewController *)viewController:(UIView *)view;
@end
