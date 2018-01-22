//
//  PPViewManager.h
//  PPManagers
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark category ImageTitleSpacing of UIButton
// 定义一个枚举（包含了四种类型的button）单选框
typedef NS_ENUM(NSUInteger, JCButtonEdgeInsetsStyle) {
    JCButtonEdgeInsetsStyleTop, // image在上，label在下
    JCButtonEdgeInsetsStyleLeft, // image在左，label在右
    JCButtonEdgeInsetsStyleBottom, // image在下，label在上
    JCButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (ImageTitleSpacing)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(JCButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

/** 封装的单选框
 *  试了一下,有个bug
 *  selectedImage:(UIImage *)selectedImage
 *  这个属性不能设置, 字会变色, 整个按钮变成高亮, 暂时没时间解决这个问题
 *  所以干脆不设置了, 在按钮的点中方法里面自己设置吧
 *  EdgeInsetsStyle 这个属性是上面的格式, 参考一下
 *  tag, 主要就是区分多个按钮的
 */
+ (UIButton *_Nonnull)singleSelectBtnWithTitle:(NSString *_Nullable)title
                                      FontSize:(CGFloat)fontSize
                                         Image:(UIImage *_Nullable)image
                               EdgeInsetsStyle:(JCButtonEdgeInsetsStyle)style
                               imageTitleSpace:(CGFloat)space
                                           tag:(NSInteger)tag
                                        target:(nullable id)target
                                        action:(nonnull SEL)action
                                 ControlEvents:(UIControlEvents)controlEvents;
@end

#pragma mark category Image of UIImage
@interface UIImage (Image)


/**
 return an original image
 
 @param imageName imageName
 @return image
 */
+ (UIImage *_Nullable)imageOriginalWithName:(NSString *_Nullable)imageName;


/**
 func to return an image
 
 @param imageName imageName
 @return image
 */
UIImage * _Nullable UIImageWithImageName(NSString * _Nullable imageName);

UIImage * _Nullable UIImageOriginalWithImageName(NSString * _Nullable imageName);

/** 根据宽度重新缩放图片之后返回高度 */
- (CGFloat)heightWithEqualScaleByWidth:(CGFloat)width;
/** 根据高度重新缩放图片之后返回宽度 */
- (CGFloat)widthWithEqualScaleByHeight:(CGFloat)height;
@end

#pragma mark category DIYView of UIView
@interface UIView (DIYView)

+ (void)drawRectContentViewCorner:(UIView *_Nonnull)cellContentView cornerStyle:(UIRectCorner)style;

+ (void)drawRectContentViewBottomCorner:(UIView *_Nonnull)contentView dataArray:(NSArray *_Nonnull)array indexPath:(NSIndexPath *_Nonnull)indexPath;

+ (void)drawRectContentView:(UIView *_Nonnull)cellContentView dataArray:(NSArray *_Nonnull)array indexPath:(NSIndexPath *_Nonnull)indexPath;

@property CGFloat pp_frameX;
@property CGFloat pp_frameY;
@property CGFloat pp_boundsX;
@property CGFloat pp_boundsY;
@property CGFloat pp_width;
@property CGFloat pp_height;

/** 相对的中心调整, 主要解决的是父视图界面frame不等于bounds的时候, center位置不对 滚动页面里面frame都不等于bounds */
CGPoint relativeCenterBySuperFrame(CGRect superFrame);

@end

#pragma mark category DIYImageView of UIImageView
@interface UIImageView (DIYImageView)
+ (UIImageView *_Nonnull)ImageViewWithFrame:(CGRect)frame Image:(UIImage *_Nullable)image;
+ (UIImageView *_Nonnull)ImageViewWithFrame:(CGRect)frame ImageName:(NSString *_Nonnull)imageName;
@end

#pragma mark category DIYLabel of UILabel
@interface UILabel (DIYLabel)
/** 根据宽度计算文字的高度 */
+(CGFloat)textHeightWithString:(NSString *)string andFont:(UIFont *)fontsize andwidth:(CGFloat)numsize;

/** 根据高度计算文字的宽度 */
+(CGFloat)textWidthWithString:(NSString *)string andFont:(UIFont *)fontsize andHight:(CGFloat)numsize;

@end

@interface PPViewManager : UIView

@end
