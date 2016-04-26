//
//  TTNetReloader.m
//  XTNetReloader
//
//  Created by TT_code on 16/4/26.
//  Copyright © 2016年 teason. All rights reserved.
//


#import "TTNetReloader.h"
@interface TTNetReloader()

/** *显示提示图片  */
@property(nonatomic,strong)UIImageView* imageview;
/** *显示提示文字  */
@property(nonatomic,strong)UILabel*  promptLabel;
/** *显示提示按钮  */
@property(nonatomic,strong)UIButton*  clickButton;

@end

@implementation TTNetReloader


- (instancetype)initWithView:(UIView*)view  imagename:(NSString*)imagename   promptTitle:(NSString*)prompttitle  ButtonClickBlock:(ButtonClickBlock)clickBlock
{
    return [self initWithView:view imagename:imagename promptTitle:prompttitle buttontitle:@"重新加载" ButtonClickBlock:clickBlock];
}



/**
 *  初始化
 *
 */
- (instancetype)initWithView:(UIView*)view  imagename:(NSString*)imagename   promptTitle:(NSString*)prompttitle  buttontitle:(NSString*)buttontitle  ButtonClickBlock:(ButtonClickBlock)clickBlock
{
    self = [super initWithFrame:view.bounds];
    if (self) {
        self.backgroundColor=view.backgroundColor;
        //赋值
        self.blcok = clickBlock ;
        //设置位置
        [self UpddateUIFrampromptTitle:prompttitle imagename:imagename buttontitle:buttontitle];
        //显示
        [self showInView:view];
    }
    return self;
}



-(void)UpddateUIFrampromptTitle:(NSString*)prompttitle    imagename:(NSString*)imagename  buttontitle:(NSString*)buttontitle
{
    //宽度和高度----图片
   CGFloat imgW=[UIImage imageNamed:imagename].size.width;
   CGFloat imgH=[UIImage imageNamed:imagename].size.height;
    
    //宽度和高度----label
    CGFloat labelW=self.bounds.size.width;
    CGFloat labelH=44;
    
    
    //宽度和高度----button
    CGFloat buttonW=150;
    CGFloat buttonH=44;
    
    
    //布局imageview
    CGFloat totolHeight=imgH+labelH+buttonH+20;
    self.imageview.frame=CGRectMake(self.bounds.size.width/2-imgW/2, self.bounds.size.height/2-totolHeight/2, imgW, imgH);
    self.imageview.image=[UIImage imageNamed:imagename];
    
    //布局label
    self.promptLabel.frame=CGRectMake(0,CGRectGetMaxY(self.imageview.frame)+10, labelW, labelH);
    self.promptLabel.text=prompttitle;
    
    //布局button
    self.clickButton.frame=CGRectMake(self.bounds.size.width/2-buttonW/2, CGRectGetMaxY(self.promptLabel.frame)+10, buttonW, buttonH);
    [self.clickButton setTitle:buttontitle forState:UIControlStateNormal];
    [self.clickButton.layer setMasksToBounds:YES];
    self.clickButton.layer.borderWidth=1;
    [self.clickButton.layer setCornerRadius:5.0];
    self.clickButton.layer.borderColor=[UIColor blackColor].CGColor;    
}




/**
 *  显示
 *
 *  @param viewWillShow 需要显示的试图
 */
- (void)showInView:(UIView *)viewWillShow
{
    [viewWillShow addSubview:self] ;
}

/**
 *  移除
 */
- (void)dismiss
{
    [self removeFromSuperview] ;
}



/**
 *  懒加载
 */
-(UIImageView *)imageview
{
    if(!_imageview)
    {
        _imageview=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:_imageview];
    }
    return _imageview;
}

-(UILabel *)promptLabel
{
    if(!_promptLabel){
        _promptLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        _promptLabel.textAlignment=NSTextAlignmentCenter;
        _promptLabel.font=[UIFont systemFontOfSize:17];
        [self addSubview:_promptLabel];
    }
    return _promptLabel;
}

-(UIButton *)clickButton
{
    if(!_clickButton){
        _clickButton=[[UIButton alloc]initWithFrame:CGRectZero];
        _clickButton.titleLabel.font=[UIFont systemFontOfSize:15];
        [_clickButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [_clickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_clickButton addTarget:self action:@selector(ButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_clickButton];
    }
    return _clickButton;
}


/**
 *    button  点击事件
 */
-(void)ButtonClicked
{
    self.blcok();
}



@end
