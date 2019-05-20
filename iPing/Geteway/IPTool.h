//
//  GateWay.h
//  Demo
//
//  Created by 纪洪波 on 2018/10/18.
//  Copyright © 2018 Ankit Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPTool : NSObject
+ (nullable NSString *)getGatewayIPAddress;
+ (nullable NSString *)getDeviceIPAddress;
@end

NS_ASSUME_NONNULL_END
