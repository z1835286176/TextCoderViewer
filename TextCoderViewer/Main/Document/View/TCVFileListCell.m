//
//  TCVFileListCell.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVFileListCell.h"

@interface TCVFileListCell ()

/** 编辑模式下的选择 */
@property (nonatomic, weak) UIImageView *selImageView;

/** 文件图标 */
@property (nonatomic, weak) UIImageView *fileImageView;

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UILabel *sizeLabel;

@end

@implementation TCVFileListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.isSeled = NO;
        // 左边一个图片
        UIImageView *imageView = [UIImageView new];
        [self.contentView addSubview:imageView];
        self.fileImageView = imageView;
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(40);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        
        // 一个nameLabel, 距图片顶 0
        UILabel *nameLabel = [[UILabel alloc] init];
        [nameLabel setFont:[UIFont systemFontOfSize:15]];
        [nameLabel setText:@"名字"];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(5);
            make.top.equalTo(imageView.mas_top);
            make.right.equalTo(self.contentView.mas_right).with.offset(-20);
            make.height.mas_equalTo(21);
        }];
        
        // 修改时间 (如果是文件, 还有文件的大小)
        UILabel *timeLabel = [[UILabel alloc] init];
        [timeLabel setFont:[UIFont systemFontOfSize:11]];
        [timeLabel setText:@"一天前"];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        CGFloat width = [UILabel textWidthWithString:@"一天前" andFont:[UIFont systemFontOfSize:11] andHight:21] + 0.5;
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.height.equalTo(nameLabel);
            make.width.mas_equalTo(width);
            make.bottom.equalTo(imageView.mas_bottom).with.offset(5);
        }];
    }
    return self;
}

- (void)setFileModel:(TCVFileModel *)fileModel {
    _fileModel = fileModel;
    self.accessoryType = fileModel.isDir ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    [self.fileImageView setImage:UIImageWithImageName(fileModel.isDir ? @"Folder_Desktop" : @"file")];
    
    self.nameLabel.text = fileModel.name;
    NSString *timeString = [PPDateManager checkTimeIntervalSinceGivenDate:fileModel.modificationDate];
    self.timeLabel.text = timeString;
    CGFloat width = [UILabel textWidthWithString:timeString andFont:[UIFont systemFontOfSize:11] andHight:21] + 0.5;
    [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
    
    if(fileModel.isDir) {
        if(self.sizeLabel) {
            self.sizeLabel.hidden = YES;
        }
    } else {
        
        if(nil == self.sizeLabel) {
            UILabel *sizeLabel = [[UILabel alloc] init];
            [sizeLabel setFont:[UIFont systemFontOfSize:11]];
            [sizeLabel setText:@"100kb"];
            [self.contentView addSubview:sizeLabel];
            self.sizeLabel = sizeLabel;
            
            [sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.timeLabel.mas_right).with.offset(5);
                make.centerY.height.equalTo(self.timeLabel);
                make.width.mas_equalTo(50);
            }];
        }
        
        self.sizeLabel.hidden = NO;
        NSString *sizeString = [NSString stringWithFormat:@" · %@", [PPDataManager checkByteIntervalWithGivenBytes:fileModel.size]];
        self.sizeLabel.text = sizeString;
        width = [UILabel textWidthWithString:sizeString andFont:[UIFont systemFontOfSize:11] andHight:21] + 0.5;
        [self.sizeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
        }];
    }
}

- (void)beganToEdit:(BOOL)isEditing {
    if(isEditing) {
        
        self.isSeled = NO;
        [UIView animateWithDuration:1 animations:^{
            
            // 最左边要有一个单选框, 一个图片即可
            UIImageView *selImageView = [UIImageView ImageViewWithFrame:CGRectMake(0, 0, 25, 25) ImageName:@"unsel"];
            [self.contentView addSubview:selImageView];
            self.selImageView = selImageView;
            
            [selImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).with.offset(10);
                make.size.mas_offset(CGSizeMake(25, 25));
                make.centerY.equalTo(self.contentView);
            }];
            
            // 而且, 上面其他的控件往右移动
            [self.fileImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).with.offset(10 + 30);
            }];
            
        } completion:^(BOOL finished) {
            self.accessoryType = UITableViewCellAccessoryNone;
        }];
        
    } else {
        self.isSeled = NO;
        
        [UIView animateWithDuration:1 animations:^{
            [self.selImageView removeFromSuperview];
            self.selImageView = nil;
            
            // 控件回位
            [self.fileImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).with.offset(10);
            }];
            
        } completion:^(BOOL finished) {
            self.accessoryType = self.fileModel.isDir ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        }];
    }
}

- (void)setIsSeled:(BOOL)isSeled {
    _isSeled = isSeled;
    if(self.selImageView) {
        [self.selImageView setImage:UIImageWithImageName(isSeled ? @"sel" : @"unsel")];
        
    }
}

@end
