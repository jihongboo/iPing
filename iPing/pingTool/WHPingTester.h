//
//  WHPingTester.h
//  BigVPN
//
//  Created by wanghe on 2017/5/11.
//  Copyright © 2017年 wanghe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimplePing.h"

@protocol WHPingDelegate <NSObject>
@optional
- (void) didPingSucccessWithTime:(float)time withError:(nullable NSError*) error;
@end


@interface WHPingTester : NSObject<SimplePingDelegate>
typedef NS_ENUM(NSUInteger, WHPingStatus){
    WHPingStatusSending = 0 << 0,
    WHPingStatusTimeout = 1 << 1,
    WHPingStatusSended = 2 << 2,
};

@property (nonatomic, weak, readwrite) id<WHPingDelegate> _Nullable delegate;

- (instancetype _Nonnull )init NS_UNAVAILABLE;
- (instancetype _Nonnull )initWithHostName:(NSString * _Nonnull)hostName NS_DESIGNATED_INITIALIZER;

- (void)startPing;
- (void)stopPing;
@end


@interface WHPingItem : NSObject
//@property(nonatomic, assign) WHPingStatus status;
@property(nonatomic, assign) uint16_t sequence;
@end



