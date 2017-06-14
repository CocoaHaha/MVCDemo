//
//  HomeTableViewCell.h
//  百事通
//
//  Created by SXF on 2017/3/23.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@class HomeModel;

static  NSString *homeIndentifier=@"homeCell";

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic,strong)HomeModel *homeModel;
//我们最后得到cell的高度的方法
-(CGFloat)rowHeightWithCellModel:(HomeModel *)homeModel;

@end
