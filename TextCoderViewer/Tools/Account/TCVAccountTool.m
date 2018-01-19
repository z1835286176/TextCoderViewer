//
//  TCVAccountTool.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/18.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVAccountTool.h"

@implementation TCVAccountTool

/** 支持的可连接列表 */
+ (NSArray *)AllServiceSupportedLists {
    
    /** 本打算用数据库存储四个方式的, 但是想想太麻烦了, 不如直接写死的好 */
    NSMutableArray *serviceSupportedModels = [NSMutableArray array];
    
    // 直接准备数据
    // 1. FTP
    NSDictionary *ftpDic = @{@"name" : @"FTP",
                             @"displayName" : @"FTP",
                             @"icon" : @"serS_ftp_icon",
                             @"type" : @(TCVAccountConnectTypesFTP),
                             };
    TCVServiceSupportedModel *serviceSModelFTP = [TCVServiceSupportedModel yy_modelWithJSON:ftpDic];
    [serviceSupportedModels addObject:serviceSModelFTP];

    // 2. GitHub
    NSDictionary *gitHubDic = @{@"name" : @"GitHub",
                             @"displayName" : @"GitHub",
                             @"icon" : @"serS_gitHub_icon",
                             @"type" : @(TCVAccountConnectTypesGitHub),
                             };
    TCVServiceSupportedModel *serviceSModelGitHub = [TCVServiceSupportedModel yy_modelWithJSON:gitHubDic];
    [serviceSupportedModels addObject:serviceSModelGitHub];
    
    // 3. Bitbucket
    NSDictionary *bitbucketDic = @{@"name" : @"Bitbucket",
                             @"displayName" : @"Bitbucket",
                             @"icon" : @"serS_bitbucket_icon",
                             @"type" : @(TCVAccountConnectTypesBitbucket),
                             };
    TCVServiceSupportedModel *serviceSModelBitbucket = [TCVServiceSupportedModel yy_modelWithJSON:bitbucketDic];
    [serviceSupportedModels addObject:serviceSModelBitbucket];
    
    // 4. Dropbox
    NSDictionary *dropboxDic = @{@"name" : @"Dropbox",
                             @"displayName" : @"Dropbox",
                             @"icon" : @"serS_dropbox_icon",
                             @"type" : @(TCVAccountConnectTypesDropbox),
                             };
    TCVServiceSupportedModel *serviceSModelDropbox = [TCVServiceSupportedModel yy_modelWithJSON:dropboxDic];
    [serviceSupportedModels addObject:serviceSModelDropbox];

    return serviceSupportedModels;
}

#warning 获取所有的用户或连接
/** 所有已经保存的连接列表 */
+ (NSArray *)AllAccountConnects {
    
    
    return @[];
}

#warning 保存连接
/** 保存可用的连接列表 */
+ (BOOL)saveAccountConnect:(NSDictionary *)accountConnect accountConnectType:(TCVAccountConnectTypes)accountConnectType {
    
    
    return YES;
}

@end
