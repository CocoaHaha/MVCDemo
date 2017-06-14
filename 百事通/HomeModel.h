//
//  HomeModel.h
//  百事通
//
//  Created by SXF on 2017/3/23.
//  Copyright © 2017年 SXF. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (nonatomic,copy) NSString *icon; //图片
@property (nonatomic,copy) NSString *content; //内容的label
//单元格的高度
@property (nonatomic,assign) CGFloat cellHeight;

@end
