//
//  PreventMulClicks.h
//  Moke
//
//  Created by LeeQQ on 16/7/20.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreventMulClicks : UIButton
/**
 *  按钮点击的间隔时间
 */
@property (nonatomic, assign) NSTimeInterval clickDurationTime;

@end
