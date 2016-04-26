//
//  TTNetReloader.h
//  XTNetReloader
//
//  Created by TT_code on 16/4/26.
//  Copyright © 2016年 teason. All rights reserved.
//
typedef void(^ButtonClickBlock)() ;

#import <UIKit/UIKit.h>
/**
 *    无数据提示和网络提示
 */
@interface TTNetReloader : UIView

/** *block--监听点击  */
@property (nonatomic,copy) ButtonClickBlock blcok ;


/**
 *  设置无数据或者无网络显示图
 *
 *  @param view        需要显示的试图
 *  @param imagename   图片名称
 *  @param prompttitle 提示文字
 *  @param clickBlock  监听点击
 *
 *  @return self
 */
- (instancetype)initWithView:(UIView*)view  imagename:(NSString*)imagename   promptTitle:(NSString*)prompttitle  ButtonClickBlock:(ButtonClickBlock)clickBlock;

/**
 *  设置无数据或者无网络显示图
 *
 *  @param view         需要显示的试图
 *  @param imagename   图片名称
 *  @param prompttitle 提示文字
 *  @param buttontitle 按钮标题
 *  @param clickBlock  监听点击
 *
 *  @return self
 */
- (instancetype)initWithView:(UIView*)view  imagename:(NSString*)imagename   promptTitle:(NSString*)prompttitle  buttontitle:(NSString*)buttontitle  ButtonClickBlock:(ButtonClickBlock)clickBlock;



/**
 *  移除
 */
- (void)dismiss;


@end
