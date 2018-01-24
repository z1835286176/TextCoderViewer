//
//  TCVServiceListCell.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/24.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVServiceListCell.h"

@interface TCVServiceListCell ()

@property (nonatomic, weak) UIImageView *headImageView;

@property (nonatomic, weak) UILabel *serviceTypeLabel;

@property (nonatomic, weak) UILabel *nameLabel;

@end

@implementation TCVServiceListCell

/** 因为不知道FTP 连接什么样式, 所以先假设所有的账号都是github */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 头像
        UIImageView *headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:headImageView];
        self.headImageView = headImageView;
        
        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }];
        
        // 账号类别 - GitHub
        UILabel *serviceTypeLabel = [[UILabel alloc] init];
        serviceTypeLabel.textAlignment = NSTextAlignmentLeft;
        serviceTypeLabel.font = UIFontWithBoldSize(16);
        serviceTypeLabel.text = @"GitHub";
        [self.contentView addSubview:serviceTypeLabel];
        self.serviceTypeLabel = serviceTypeLabel;
        
        [serviceTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headImageView.mas_right).with.offset(10);
            make.top.equalTo(headImageView.mas_top);
            make.height.mas_equalTo(21);
            make.right.equalTo(self.contentView.mas_right).with.offset(-50);
        }];
        
        // 用户 - @LiuZhangpeng
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.textColor = [UIColor colorWithWholeRed:86 green:97 blue:113];
        nameLabel.text = @"@LiuZhangpeng";
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headImageView.mas_right).with.offset(10);
            make.bottom.equalTo(headImageView.mas_bottom);
            make.height.mas_equalTo(21);
            make.right.equalTo(self.contentView.mas_right).with.offset(-50);
        }];
    }
    return self;
}

- (void)setAccount:(TCVAccount *)account {
    _account = account;
    
    switch (account.serviceSupportedType) {
        case TCVServiceSupportedTypesFTP: {
            
        }
            break;
        case TCVServiceSupportedTypesGitHub: {
            TCVAccountOfGithub *gitHubAccount =(TCVAccountOfGithub *)account;
            self.headImageView.image = UIImageWithImageName(gitHubAccount.headIcon);
            self.nameLabel.text = [NSString stringWithFormat:@"@%@", gitHubAccount.userName];
        }
            break;
        case TCVServiceSupportedTypesBitbucket: {
            
        }
            break;
        case TCVServiceSupportedTypesDropbox: {
            
        }
            break;
        default:
            break;
    }
}

@end
