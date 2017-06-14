//
//  HomeModel.m
//  百事通
//
//  Created by SXF on 2017/3/23.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import "HomeModel.h"
#import "HomeTableViewCell.h"

@implementation HomeModel

//惰性初始化是这样写的
-(CGFloat)cellHeight
{
    //只在初始化的时候调用一次就Ok
    if(!_cellHeight){
        HomeTableViewCell *cell=[[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:homeIndentifier];
        NSLog(@"我要计算高度");
        // 调用cell的方法计算出高度
        _cellHeight=[cell rowHeightWithCellModel:self];
        
    }
    
    return _cellHeight;
}

@end
