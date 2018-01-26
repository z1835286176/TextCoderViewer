//
//  TCVGitHubRepositoriesCell.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/25.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVGitHubRepositoriesCell.h"

@implementation TCVGitHubRepositoriesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 左上角一个 小图片
//        Repository
    }
    return self;
}

- (void)setSepositoriesModel:(TCVGitHubRepositoriesModel *)sepositoriesModel {
    _sepositoriesModel = sepositoriesModel;
}

@end
