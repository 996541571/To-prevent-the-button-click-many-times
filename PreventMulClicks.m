//
//  PreventMulClicks.m
//  Moke
//
//  Created by LeeQQ on 16/7/20.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "PreventMulClicks.h"

#if 0
// 默认的按钮点击时间
static const NSTimeInterval defaultDuration = 3.0f;
// 记录是否忽略按钮点击事件，默认第一次执行事件
static BOOL _isIgnoreEvent = NO;
// 设置执行按钮事件状态
static void resetState() {
    _isIgnoreEvent = NO;
}
#endif


static const NSTimeInterval defaultDuration = 3.0f;
static BOOL isIgnoreEvent = NO;
static void resetState(){
    isIgnoreEvent = NO;
}

@implementation PreventMulClicks
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (!isIgnoreEvent) {
        // 第一次执行点击事件
        isIgnoreEvent = YES; // 在指定的时间里，后面的点击事件忽略
        self.clickDurationTime = (self.clickDurationTime == 0) ? defaultDuration : self.clickDurationTime;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.clickDurationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            resetState();
        });
        // 发送按钮点击消息
        [super sendAction:action to:target forEvent:event];
    }else{
       return;
    }
}


#if 0
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    //1. 按钮点击间隔事件
    _clickDurationTime = _clickDurationTime == 0 ? defaultDuration : _clickDurationTime;
    
    //2. 是否忽略按钮点击事件
    if (_isIgnoreEvent) {
        //2.1 忽略按钮事件
        
        // 直接拦截掉super函数进行发送消息
        return;
        
    } else if(_clickDurationTime > 0) {
        //2.2 不忽略按钮事件
        
        // 后续在间隔时间内直接忽略按钮事件
        _isIgnoreEvent = YES;
        
        // 间隔事件后，执行按钮事件
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_clickDurationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            resetState();
        });
        
        // 发送按钮点击消息
        [super sendAction:action to:target forEvent:event];
    }
}
#endif

@end
