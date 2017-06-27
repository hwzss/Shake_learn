# Shake_learn
摇一摇功能实现
#一个分类实现摇一摇功能，在需要摇一摇功能的Controller中#import "UIViewController+Shake.h"
然后
```
    //通过这个方法启动界面的摇一摇响应
    [self WZ_enableShake:^{
         //这里在摇一摇后会回调
    }];
    self.WZ_spaceTime =2;//这里设置摇一摇响应后的两秒内不在响应摇一摇
```
上面的实现方式比较简单。利用CoreMotion时代里UIResponeder的motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event代理方法来获取开始摇动。
具体实现见"UIViewController+Shake.h"

这种方式摇一摇实现方式还有一种UIAcceleration类，实现 [UIAccelerometer sharedAccelerometer].delegate来获取到加速计的数据。
代理方法为：- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration 
acceleration就是加速计返回数据。
具体实现可见demo中Appdelgate中的代码。

当然UIAccelerometer在CoreMotion时代被替代了，这时我们可以使用CMMotionManager。它也可以达到UIAcceleration的效果
通过- (void)startAccelerometerUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAccelerometerHandler)handler 方法获取加速计数据，数据在回调中返回。
或者调用- (void)startAccelerometerUpdates然后在CMMotionManager单例的accelerometerData来获取此时的加速计数据。
注意：调用这两个方法后记得调用- (void)stopAccelerometerUpdates来停止获取数据，以免造成不必要的消耗
具体可见资料[文章](http://nshipster.com/cmdevicemotion/)

相关资料：
[](https://stackoverflow.com/questions/150446/how-do-i-detect-when-someone-shakes-an-iphone)
