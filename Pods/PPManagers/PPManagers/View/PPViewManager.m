//
//  PPViewManager.m
//  PPManagers
//
//  Created by istLZP on 2018/1/2.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "PPViewManager.h"

#pragma mark category ImageTitleSpacing of UIButton
/** 单选框 */
@implementation UIButton (ImageTitleSpacing)

/**** 注意
 
 此方法必须在设置按钮图文属性之后使用  否则获取到的将是空 达不到预期效果
 
 */

- (void)layoutButtonWithEdgeInsetsStyle:(JCButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space {
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    
    switch (style) {
        case JCButtonEdgeInsetsStyleTop: // image在上，label在下
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case JCButtonEdgeInsetsStyleLeft: // image在左，label在右
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case JCButtonEdgeInsetsStyleBottom: // image在下，label在上
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case JCButtonEdgeInsetsStyleRight: // image在右，label在左
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

+ (UIButton *)singleSelectBtnWithTitle:(NSString *)title FontSize:(CGFloat)fontSize Image:(UIImage *)image EdgeInsetsStyle:(JCButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space tag:(NSInteger)tag target:(id)target action:(SEL)action ControlEvents:(UIControlEvents)controlEvents {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTintColor:[UIColor blackColor]];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft]; // 左对齐
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button layoutButtonWithEdgeInsetsStyle:style imageTitleSpace:space];
    [button addTarget:target action:action forControlEvents:controlEvents];
    button.tag = tag;
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    return button;
}

@end

#pragma mark category Image of UIImage
@implementation UIImage (Image)

+ (UIImage *)imageOriginalWithName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

UIImage *UIImageWithImageName(NSString *imageName) {
    return [UIImage imageNamed:imageName];
}

UIImage *UIImageOriginalWithImageName(NSString *imageName) {
    return [UIImage imageOriginalWithName:imageName];
}

/** 根据宽度重新缩放图片之后返回高度 */
- (CGFloat)heightWithEqualScaleByWidth:(CGFloat)width {
    CGSize originSize = self.size;
    /**
     *  w / h = W / H; => h = w * H / W;
     */
    CGFloat height = width * originSize.height / originSize.width;
    return height;
}

/** 根据高度重新缩放图片之后返回宽度 */
- (CGFloat)widthWithEqualScaleByHeight:(CGFloat)height {
    CGSize originSize = self.size;
    /**
     *  w / h = W / H; => w = W * h / H;
     */
    CGFloat width = originSize.width * height / originSize.height;
    return width;
}

@end

#pragma mark category DIYView of UIView
@implementation UIView (DIYView)

+ (void)drawRectContentViewCorner:(UIView *)cellContentView cornerStyle:(UIRectCorner)style {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cellContentView.bounds byRoundingCorners:style cornerRadii:CGSizeMake(5.0, 5.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = cellContentView.bounds;
    maskLayer.path = maskPath.CGPath;
    cellContentView.layer.mask = maskLayer;
}

+ (void)drawRectContentViewBottomCorner:(UIView *)contentView dataArray:(NSArray *)array indexPath:(NSIndexPath *)indexPath {
    if (!array) {
        return;
    }
    
    if (indexPath.row == (array.count - 1)) {
        [UITableViewCell drawRectContentViewCorner:contentView cornerStyle:UIRectCornerBottomLeft|UIRectCornerBottomRight];
    }
}

+ (void)drawRectContentView:(UIView *)cellContentView dataArray:(NSArray *)array indexPath:(NSIndexPath *)indexPath {
    if (!array) {
        return;
    }
    
    if (array.count == 1) {
        [UITableViewCell drawRectContentViewCorner:cellContentView cornerStyle:UIRectCornerAllCorners];
        return;
    }
    
    if (indexPath.row == 0) {
        [UITableViewCell drawRectContentViewCorner:cellContentView cornerStyle:UIRectCornerTopLeft|UIRectCornerTopRight];
    }
    
    if (indexPath.row == (array.count - 1)) {
        [UITableViewCell drawRectContentViewCorner:cellContentView cornerStyle:UIRectCornerBottomLeft|UIRectCornerBottomRight];
    }
}

- (void)setPp_frameX:(CGFloat)pp_frameX {
    CGRect rect = self.frame;
    rect.origin.x = pp_frameX;
    self.frame = rect;
}

- (CGFloat)pp_frameX {
    return self.frame.origin.x;
}

- (void)setPp_frameY:(CGFloat)pp_frameY {
    CGRect rect = self.frame;
    rect.origin.y = pp_frameY;
    self.frame = rect;
}

- (CGFloat)pp_frameY {
    return self.frame.origin.y;
}

- (void)setPp_boundsX:(CGFloat)pp_boundsX {
    CGRect rect = self.bounds;
    rect.origin.x = pp_boundsX;
    self.bounds = rect;
}

- (CGFloat)pp_boundsX {
    return self.bounds.origin.x;
}

- (void)setPp_boundsY:(CGFloat)pp_boundsY {
    CGRect rect = self.bounds;
    rect.origin.y = pp_boundsY;
    self.bounds = rect;
}

- (CGFloat)pp_boundsY {
    return self.bounds.origin.y;
}

- (void)setPp_width:(CGFloat)pp_width {
    CGRect rect = self.frame;
    rect.size.width = pp_width;
    self.frame = rect;
}

- (CGFloat)pp_width {
    return self.frame.size.width;
}

- (void)setPp_height:(CGFloat)pp_height {
    CGRect rect = self.frame;
    rect.size.height = pp_height;
    self.frame = rect;
}

- (CGFloat)pp_height {
    return self.frame.size.height;
}

CGPoint relativeCenterBySuperFrame(CGRect superFrame) {
    CGFloat x = (superFrame.size.width) * 0.5;
    CGFloat y = (superFrame.size.height) * 0.5;
    return CGPointMake(x, y);
}

@end

#pragma mark category DIYImageView of UIImageView
@implementation UIImageView (DIYImageView)
+ (UIImageView *_Nonnull)ImageViewWithFrame:(CGRect)frame Image:(UIImage *_Nullable)image {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView setImage:image];
    return imageView;
}

+ (UIImageView *_Nonnull)ImageViewWithFrame:(CGRect)frame ImageName:(NSString *_Nonnull)imageName {
    return [self ImageViewWithFrame:frame Image:UIImageWithImageName(imageName)];
}
@end

#pragma mark category DIYLabel of UILabel
@implementation UILabel (DIYLabel)

/** 根据宽度计算文字的高度 */
+(CGFloat)textHeightWithString:(NSString *)string andFont:(UIFont *)fontsize andwidth:(CGFloat)numsize {
    NSString *text = string;
    UIFont *font = fontsize;//跟label的字体大小一样
    CGSize size = CGSizeMake(numsize, MAXFLOAT);//跟label的宽设置一样
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.height;
}

/** 根据高度计算文字的宽度 */
+(CGFloat)textWidthWithString:(NSString *)string andFont:(UIFont *)fontsize andHight:(CGFloat)numsize {
    NSString *text = string;
    UIFont *font = fontsize;//跟label的字体大小一样
    CGSize size = CGSizeMake(MAXFLOAT, numsize);//跟label的宽设置一样
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size.width;
}

@end

@implementation PPViewManager

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
