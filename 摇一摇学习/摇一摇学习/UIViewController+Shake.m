//
//  UIViewController+Shake.m
//  摇一摇学习
//
//  Created by qwkj on 2017/6/26.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "UIViewController+Shake.h"
#import <objc/runtime.h>

@interface UIViewController ()

@property (assign)BOOL canRespondShake;
@end

@implementation UIViewController (Shake)

#pragma -mark getter setter
-(int64_t)WZ_spaceTime{
    NSNumber *ob = objc_getAssociatedObject(self, @selector(WZ_spaceTime));
    return ob.longLongValue;
}
-(void)setWZ_spaceTime:(int64_t)WZ_spaceTime{
    objc_setAssociatedObject(self, @selector(WZ_spaceTime), @(WZ_spaceTime), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)canRespondShake{
    NSNumber *boolOb = objc_getAssociatedObject(self, @selector(canRespondShake));
    return boolOb.boolValue;
}
-(void)setCanRespondShake:(BOOL)canRespondShake{
    objc_setAssociatedObject(self, @selector(canRespondShake), [NSNumber numberWithBool:canRespondShake], OBJC_ASSOCIATION_ASSIGN);
 
}

-(WZ_ShakeBlock)shakeBlock{
    return objc_getAssociatedObject(self, @selector(shakeBlock));
}
-(void)setShakeBlock:(WZ_ShakeBlock)shakeBlock{
    objc_setAssociatedObject(self, @selector(shakeBlock), shakeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(BOOL)WZ_shake{
    NSNumber *boolOb = objc_getAssociatedObject(self, @selector(WZ_shake));
    return boolOb.boolValue;
}
-(void)setWZ_shake:(BOOL)WZ_shake{
    objc_setAssociatedObject(self, @selector(WZ_shake), [NSNumber numberWithBool:WZ_shake], OBJC_ASSOCIATION_ASSIGN);
}

#pragma -mark 分割线～～

-(void)WZ_enableShake:(WZ_ShakeBlock )shakeBlock{
    self.shakeBlock = shakeBlock;
    self.WZ_shake = YES;
    self.canRespondShake = YES;
    [self becomeFirstResponder];
}


-(void)enableShake{
    
    [self becomeFirstResponder];
}
-(void)disableShake{
    
    [self resignFirstResponder];
}
#pragma mark - 摇动

/**
 *  摇动开始
 */
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (motion == UIEventSubtypeMotionShake) {
        
        if (self.WZ_shake&&self.canRespondShake) {
            if (self.WZ_spaceTime&&self.WZ_spaceTime!=0) {
                self.canRespondShake = NO;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.WZ_spaceTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.canRespondShake = YES;
                });
            }
            if (self.shakeBlock) {
                self.shakeBlock();
            }
        }

    }
}

///**
// *  摇动结束
// */
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
//    
//}
//
///**
// *  摇动取消
// */
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
//    
//}

@end
