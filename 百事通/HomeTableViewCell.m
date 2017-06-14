//
//  HomeTableViewCell.m
//  百事通
//
//  Created by SXF on 2017/3/23.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeModel.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//头像的高度
#define iconH 120
#define iconW 120
//间距
#define  marginW 10

@interface HomeTableViewCell ()

@property (nonatomic,weak) UIImageView *icon;  //头像
@property (nonatomic,weak) UILabel *content; //显示文本的label
@property (nonatomic,weak) UIImageView *line;  //下划线

//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGFloat contentLabelH;

@end
@implementation HomeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加子控件
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    //1.添加图片
    UIImageView *icon=[UIImageView new];
    icon.contentMode=UIViewContentModeScaleAspectFill;
    icon.clipsToBounds=YES;
    [self.contentView addSubview:icon];
    self.icon=icon;
    //2.添加label
    UILabel *content=[UILabel new];
    content.numberOfLines=0; //多行显示
    content.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:content];
    self.content=content;
    //3.底部添加一条线
    UIImageView *line=[UIImageView new];
    line.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:line];
    self.line=line;
    
    __weak typeof(self) weakSelf = self;
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.height.mas_equalTo(iconH);  //头像的高度
        //        make.width.mas_equalTo(iconW); //头像的宽度
        make.size.mas_equalTo(CGSizeMake(iconH,iconH));
        make.top.equalTo(weakSelf.mas_top).offset(marginW) ; //距离顶部10的距离
        make.centerX.equalTo(weakSelf.mas_centerX); //头像的中心x和cell的中心x一样
        
    }];
    //2.设置contentLabel
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).offset(marginW); //文本距离头像底部10个间距
        make.left.equalTo(weakSelf.mas_left).offset(marginW);  //文本距离左边的距离
        make.right.equalTo(weakSelf.mas_right).offset(-marginW);  //文本距离右边的距离
        
        //文本高度 我们再得到模型的时候 在传递
    }];
    
    
    //3.设置下划线的大小
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-marginW); //下划线距离底部10的距离
        //        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0.01, 0, marginW, 0));
    }];

}
//传递数据模型
-(void)setHomeModel:(HomeModel *)homeModel
{
    _homeModel=homeModel;
    
    self.icon.image=[UIImage imageNamed:homeModel.icon];  //头像
    self.content.text=homeModel.content; //文本内容
}

-(CGFloat)rowHeightWithCellModel:(HomeModel *)homeModel{
    
    _homeModel=homeModel;
    __weak __typeof(&*self)weakSelf = self;
    //设置标签的高度
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(weakSelf.contentLabelH);
    }];
    
    // 2. 更新约束
    [self layoutIfNeeded];
    
    //3.  视图的最大 Y 值
    CGFloat h= CGRectGetMaxY(self.content.frame);
    
    return h+marginW; //最大的高度+10
}
-(CGFloat)contentLabelH
{
    if(!_contentLabelH){
        CGFloat h=[self.homeModel.content boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width)-2*marginW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
        
        _contentLabelH=h+marginW;  //内容距离底部下划线10的距离
    }
    return _contentLabelH;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
