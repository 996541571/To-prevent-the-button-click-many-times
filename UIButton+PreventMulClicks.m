//
//  UIButton+PreventMulClicks.m
//  Test
//
//  Created by LeeQQ on 16/7/21.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "UIButton+PreventMulClicks.h"

static const NSTimeInterval defaultDuration = 3.0f;
static BOOL isIgnoreEvent = NO;
static void resetState(){
    isIgnoreEvent = NO;
}

@implementation UIButton (PreventMulClicks)


- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (!isIgnoreEvent) {
        // 第一次执行点击事件
        isIgnoreEvent = YES; // 在指定的时间里，后面的点击事件忽略
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(defaultDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            resetState();
        });
        // 发送按钮点击消息
        [super sendAction:action to:target forEvent:event];
    }else{
        return;
    }
    
}


@end
