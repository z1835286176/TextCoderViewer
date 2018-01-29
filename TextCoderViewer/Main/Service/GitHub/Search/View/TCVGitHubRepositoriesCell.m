//
//  TCVGitHubRepositoriesCell.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/25.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVGitHubRepositoriesCell.h"

@interface TCVGitHubRepositoriesCell()

@property (nonatomic, weak) UIView *repoImageView;
@property (nonatomic, weak) UILabel *ownerLabel;
@property (nonatomic, weak) UILabel *descriptionLabel;
@property (nonatomic, weak) UILabel *codeLabel;
@property (nonatomic, weak) UILabel *starLabel;
@property (nonatomic, weak) UILabel *forkLabel;
@property (nonatomic, weak) UIImageView *codeImageView;
@property (nonatomic, weak) UIImageView *starImageView;
@end

@implementation TCVGitHubRepositoriesCell

float v_label_image_A = 25;
float v_label_image_B = 8;
float imageWidthLittle = 10;
float image_label = 2;
float label_image = 8;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 左上角一个 小图片 Repository
        UIImageView *repoImageView = [UIImageView ImageViewWithFrame:CGRectMake(0, 0, 30, 20) ImageName:@"Repository"];
        [self.contentView addSubview:repoImageView];
        self.repoImageView = repoImageView;
        
        [repoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(20);
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        // clone button
        UIButton *cloneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [cloneButton setTitle:@"Clone" forState:UIControlStateNormal];
        [self.contentView addSubview:cloneButton];
        
        [cloneButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(60, 25));
        }];
        
        [cloneButton setRoundRect:4 borderWith:1 borderColor:[UIColor colorWithWholeRed:20 green:108 blue:246]];
        
        // ownerLabel
        UILabel *ownerLabel = [[UILabel alloc] init];
        [ownerLabel setFont:UIFontSystemSizeFont(17)];
        [ownerLabel setTextAlignment:NSTextAlignmentLeft];
        [ownerLabel setTextColor:[UIColor colorWithWholeRed:34 green:67 blue:162]];
        [ownerLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [ownerLabel setText:@"LiuZhangPeng / TextCoderViewer"];
        [self.contentView addSubview:ownerLabel];
        self.ownerLabel = ownerLabel;
        
        [ownerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(15);
            make.left.equalTo(repoImageView.mas_right).with.offset(10);
            make.right.equalTo(cloneButton.mas_left).with.offset(-20);
            make.height.mas_equalTo(20);
        }];
        
        // descriptionLabel
        UILabel *descriptionLabel = [[UILabel alloc] init];
        [descriptionLabel setFont:UIFontSystemSizeFont(14)];
        [descriptionLabel setTextAlignment:NSTextAlignmentLeft];
        [descriptionLabel setTextColor:[UIColor colorWithWholeRed:85 green:85 blue:85]];
        [descriptionLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [descriptionLabel setText:@"High performance model framework for iOS/OSX."];
        [self.contentView addSubview:descriptionLabel];
        self.descriptionLabel = descriptionLabel;
        
        [descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ownerLabel.mas_bottom).with.offset(1);
            make.left.right.equalTo(ownerLabel);
            make.height.mas_equalTo(20);
        }];
        
        // codeImageView
        UIImageView *codeImageView = [UIImageView ImageViewWithFrame:CGRectZero ImageName:@"github.code"];
        [self.contentView addSubview:codeImageView];
        self.codeImageView = codeImageView;
        
        [codeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ownerLabel.mas_bottom).with.offset(v_label_image_A);
            make.left.equalTo(ownerLabel.mas_left);
            make.size.mas_equalTo(CGSizeMake(imageWidthLittle, imageWidthLittle));
        }];
        
        // codeLabel
        UILabel *codeLabel = [[UILabel alloc] init];
        [codeLabel setFont:UIFontSystemSizeFont(12)];
        [codeLabel setTextAlignment:NSTextAlignmentLeft];
        [codeLabel setTextColor:[UIColor colorWithWholeRed:170 green:170 blue:170]];
        [codeLabel setText:@"Objective-C"];
        [self.contentView addSubview:codeLabel];
        self.codeLabel = codeLabel;
        
        CGFloat width = [UILabel textWidthWithString:@"Objective-C" andFont:UIFontSystemSizeFont(12) andHight:21] + 2;
        [codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(codeImageView.mas_right).with.offset(image_label);
            make.centerY.equalTo(codeImageView.mas_centerY);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(18);
        }];
        
        // starImageView
        UIImageView *starImageView = [UIImageView ImageViewWithFrame:CGRectZero ImageName:@"github.star"];
        [self.contentView addSubview:starImageView];
        self.starImageView = starImageView;
        
        [starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ownerLabel.mas_bottom).with.offset(v_label_image_A);
            make.left.equalTo(ownerLabel.mas_left).with.offset(imageWidthLittle + image_label + width + label_image);
            make.size.mas_equalTo(CGSizeMake(imageWidthLittle, imageWidthLittle));
        }];
        
        // starLabel
        UILabel *starLabel = [[UILabel alloc] init];
        [starLabel setFont:UIFontSystemSizeFont(12)];
        [starLabel setTextAlignment:NSTextAlignmentLeft];
        [starLabel setTextColor:[UIColor colorWithWholeRed:170 green:170 blue:170]];
        [starLabel setText:@"3"];
        [self.contentView addSubview:starLabel];
        self.starLabel = starLabel;
        
        width = [UILabel textWidthWithString:@"2" andFont:UIFontSystemSizeFont(12) andHight:21] + 2;
        [starLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(starImageView.mas_right).with.offset(image_label);
            make.centerY.equalTo(starImageView.mas_centerY);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(18);
        }];

        // forkImageView
        UIImageView *forkImageView = [UIImageView ImageViewWithFrame:CGRectZero ImageName:@"github.fork"];
        [self.contentView addSubview:forkImageView];
        
        [forkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(starLabel.mas_right).with.offset(label_image);
            make.centerY.equalTo(starLabel.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(imageWidthLittle, imageWidthLittle));
        }];
        
        // forkLabel
        UILabel *forkLabel = [[UILabel alloc] init];
        [forkLabel setFont:UIFontSystemSizeFont(12)];
        [forkLabel setTextAlignment:NSTextAlignmentLeft];
        [forkLabel setTextColor:[UIColor colorWithWholeRed:170 green:170 blue:170]];
        [forkLabel setText:@"5"];
        [self.contentView addSubview:forkLabel];
        self.forkLabel = forkLabel;
        
        width = [UILabel textWidthWithString:@"5" andFont:UIFontSystemSizeFont(12) andHight:21] + 2;
        [forkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(forkImageView.mas_right).with.offset(image_label);
            make.centerY.equalTo(forkImageView.mas_centerY);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(18);
        }];
    }
    return self;
}

- (void)setRepositoriesModel:(TCVGitHubRepositoriesModel *)repositoriesModel {
    _repositoriesModel = repositoriesModel;
    
    NSString *nameString = [NSString stringWithFormat:@"%@ / %@", repositoriesModel.owner.login, repositoriesModel.name];
    [self.ownerLabel setText:nameString];
    
    if(repositoriesModel.description.length > 0) {
        
        self.descriptionLabel.hidden = NO;
        
        [self.descriptionLabel setText:repositoriesModel.description];
        [self.descriptionLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(21);
        }];
        
        [self.codeImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ownerLabel.mas_bottom).with.offset(v_label_image_A);
        }];
        
        [self.starImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ownerLabel.mas_bottom).with.offset(v_label_image_A);
        }];
        
    } else {
        
        self.descriptionLabel.hidden = YES;
        
        [self.descriptionLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        
        [self.codeImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ownerLabel.mas_bottom).with.offset(v_label_image_B);
        }];
        
        [self.starImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ownerLabel.mas_bottom).with.offset(v_label_image_B);
        }];
    }

    if(repositoriesModel.language.length > 0) {
        
        self.codeImageView.hidden = NO;
        self.codeLabel.hidden = NO;
        
        self.codeLabel.text = repositoriesModel.language;
        CGFloat width = [UILabel textWidthWithString:repositoriesModel.language andFont:UIFontSystemSizeFont(12) andHight:21] + 2;
        [self.codeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
        }];
        
        [self.starImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ownerLabel.mas_left).with.offset(imageWidthLittle + image_label + width + label_image);
        }];
    } else {
        
        self.codeImageView.hidden = YES;
        self.codeLabel.hidden = YES;
        
        [self.starImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ownerLabel.mas_left);
        }];
    }
    
    self.starLabel.text = NSStringWithNSInteger(repositoriesModel.stargazers_count);
    CGFloat width = [UILabel textWidthWithString:NSStringWithNSInteger(repositoriesModel.stargazers_count) andFont:UIFontSystemSizeFont(12) andHight:21] + 2;
    [self.starLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
    
    self.forkLabel.text = NSStringWithNSInteger(repositoriesModel.forks_count);
    width = [UILabel textWidthWithString:NSStringWithNSInteger(repositoriesModel.forks_count) andFont:UIFontSystemSizeFont(12) andHight:21] + 2;
    [self.forkLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}

@end
