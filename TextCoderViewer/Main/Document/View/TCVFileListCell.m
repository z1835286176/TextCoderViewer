//
//  TCVFileListCell.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/11.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVFileListCell.h"

@interface TCVFileListCell ()

@property (nonatomic, weak) UIImageView *fileImageView;

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UILabel *sizeLabel;

@end

@implementation TCVFileListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 左边一个图片
        UIImageView *imageView = [UIImageView new];
        [self.contentView addSubview:imageView];
        self.fileImageView = imageView;
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.height.mas_equalTo(50);
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
            make.left.equalTo(imageView.mas_right).with.offset(10);
            make.top.equalTo(imageView.mas_top);
            make.right.equalTo(self.contentView.mas_right).with.offset(-20);
            make.height.mas_equalTo(21);
        }];
        
        // 修改时间 (如果是文件, 还有文件的大小)
        UILabel *timeLabel = [[UILabel alloc] init];
        [timeLabel setFont:[UIFont systemFontOfSize:13]];
        [timeLabel setText:@"一天前"];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.height.right.equalTo(nameLabel);
            make.bottom.equalTo(imageView.mas_bottom);
        }];
        
    }
    return self;
}

- (void)setFileModel:(TCVFileModel *)fileModel {
    _fileModel = fileModel;
    self.accessoryType = fileModel.isDir ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    [self.fileImageView setImage:UIImageWithImageName(fileModel.isDir ? @"Folder_Desktop" : @"file")];
    
    self.nameLabel.text = fileModel.name;
//    self.timeLabel.text = fileModel
//    self.sizeLabel.text =
    
}

@end
