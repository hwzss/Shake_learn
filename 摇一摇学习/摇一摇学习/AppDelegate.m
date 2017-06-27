//
//  AppDelegate.m
//  摇一摇学习
//
//  Created by qwkj on 2017/6/19.
//  Copyright © 2017年 qwkj. All rights reserved.
//


//*****实现摇一摇方式二，通过获取到UIAcceleration，来计算下x,y,z上的加速度识别是否在摇动

#import "AppDelegate.h"
#import <CoreMotion/CoreMotion.h>

static BOOL L0AccelerationIsShaking(UIAcceleration* last, UIAcceleration* current, double threshold) {
    double
    deltaX = fabs(last.x - current.x),
    deltaY = fabs(last.y - current.y),
    deltaZ = fabs(last.z - current.z);
    
    return
    (deltaX > threshold && deltaY > threshold) ||
    (deltaX > threshold && deltaZ > threshold) ||
    (deltaY > threshold && deltaZ > threshold);
}

@interface AppDelegate ()<UIAccelerometerDelegate>{
    BOOL histeresisExcited;
    
    UIAcceleration* lastAcceleration;
}
@property(retain) UIAcceleration* lastAcceleration;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
       [UIAccelerometer sharedAccelerometer].delegate = self;
    return YES;
}
- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    if (self.lastAcceleration) {
        if (!histeresisExcited && L0AccelerationIsShaking(self.lastAcceleration, acceleration, 0.9)) {
            histeresisExcited = YES;
//            NSLog(@"摇一摇");
            /* SHAKE DETECTED. DO HERE WHAT YOU WANT. */
            
        } else if (histeresisExcited && !L0AccelerationIsShaking(self.lastAcceleration, acceleration, 0.2)) {
            histeresisExcited = NO;
//            NSLog(@"摇一摇结束");
        }
    }
    
    self.lastAcceleration = acceleration;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
