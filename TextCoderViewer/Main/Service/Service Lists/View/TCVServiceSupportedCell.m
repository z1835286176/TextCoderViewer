//
//  TCVServiceSupportedCell.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/18.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVServiceSupportedCell.h"
#import "TCVBackRoundView.h"

@interface TCVServiceSupportedCell()

@property (nonatomic, strong) UIView *roundBackView;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UIImageView *nameImageView;

/** comming soon */
@property (nonatomic, strong) UIView *statusView;

@end

@implementation TCVServiceSupportedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 背景色 空
        self.backgroundColor = [UIColor clearColor];
        
        // 圆角的
        UIView *roundBackView = [[UIView alloc] init];
        [roundBackView setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:roundBackView];
        self.roundBackView = roundBackView;
        
        UIEdgeInsets edges = UIEdgeInsetsMake(5, 15, 0, 15);
        [roundBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(edges);
        }];
        
        roundBackView.layer.cornerRadius = 6;
        roundBackView.layer.borderWidth = 0.5;
        roundBackView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        roundBackView.layer.masksToBounds = YES;
        
        // iconImageView
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [roundBackView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(roundBackView.mas_left).with.offset(10);
            make.centerY.equalTo(roundBackView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];

        // nameView
        UIImageView *nameImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [roundBackView addSubview:nameImageView];
        self.nameImageView = nameImageView;
        
        [nameImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconImageView.mas_right).with.offset(10);
            make.centerY.equalTo(iconImageView.mas_centerY);
            make.height.mas_equalTo(21);
            make.width.mas_equalTo(60);
        }];
    }
    
    return self;
}

- (void)setServiceSupportedModel:(TCVServiceSupportedModel *)serviceSupportedModel {
    _serviceSupportedModel = serviceSupportedModel;
    
    [self.iconImageView setImage:UIImageWithImageName(serviceSupportedModel.icon)];
    
    UIImage *nameImage = UIImageWithImageName(serviceSupportedModel.nameIcon);
    CGFloat width = [nameImage widthWithEqualScaleByHeight:21] + 1;
    [self.nameImageView setImage:nameImage];
    [self.nameImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
    
    // comming soon
    if(serviceSupportedModel.readyStatus == TCVServiceSupportedReadyYES) {
        if(self.statusView) {
            self.statusView.hidden = YES;
        }
    } else {
        if(nil == self.statusView) {
            UIView *statusView = [[UIView alloc] init];
            [statusView setBackgroundColor:[UIColor colorWithWholeRed:243.0 green:243.0 blue:243.0]];
            [self.roundBackView addSubview:statusView];
            self.statusView = statusView;
            
            width = [UILabel textWidthWithString:@"Coming soon" andFont:[UIFont systemFontOfSize:13] andHight:21] + 2;
            [statusView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.roundBackView.mas_right).with.offset(-20);
                make.centerY.equalTo(self.roundBackView);
                make.height.mas_equalTo(25);
                make.width.mas_equalTo(width + 10);
            }];
            
            statusView.layer.borderColor = [UIColor colorWithWholeRed:226 green:226 blue:226].CGColor;
            statusView.layer.borderWidth = 1;
            statusView.layer.cornerRadius = 4;
            statusView.layer.masksToBounds = YES;
            
            // label
            UILabel *statusLabel = [[UILabel alloc] init];
            [statusLabel setFont:[UIFont systemFontOfSize:13]];
            [statusLabel setTextColor:[UIColor colorWithWholeRed:167 green:167 blue:167]];
            statusLabel.textAlignment = NSTextAlignmentCenter;
            [statusLabel setText:@"Coming soon"];
            [statusView addSubview:statusLabel];
            
            // constraint
            UIEdgeInsets edges = UIEdgeInsetsMake(2, 2, 2, 2);
            [statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(edges);
            }];
        }
        
        self.statusView.hidden = NO;
    }
}

@end
