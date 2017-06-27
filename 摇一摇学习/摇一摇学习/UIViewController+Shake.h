//
//  UIViewController+Shake.h
//  摇一摇学习
//
//  Created by qwkj on 2017/6/26.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WZ_ShakeBlock)();

@interface UIViewController (Shake)


/**
 连续摇动时，两次之间的响应间隔
 */
@property (assign)int64_t WZ_spaceTime;
/**
 当前是否支持摇一摇
 */
@property (assign)BOOL WZ_shake;

/**
 摇一摇响应事件block
 */
@property (copy, nonatomic) WZ_ShakeBlock shakeBlock;


/**
 激活摇一摇功能，配置响应事件
 
 @param shakeBlock 响应事件回调
 */
-(void)WZ_enableShake:(WZ_ShakeBlock )shakeBlock;
@end
