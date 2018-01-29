//
//  TCVGitHubApiSDK.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/25.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVGitHubApiSDK.h"

@implementation TCVGitHubApiSDK

/** 查询项目 */
NSString *GitHubApi_Search_repositories(void) {
    return @"https://api.github.com/search/repositories";
}
+ (void)queryRepositoriesWithParameters:(NSDictionary *)params success:(void (^)(NSArray *))success fail:(void (^)(NSError *))fail {
    [TCVHttpTool getWithURL:GitHubApi_Search_repositories() params:params success:^(id result) {
        
        NSDictionary *resultDic = result;
        if(resultDic.count > 0) {
            NSArray *resultArray = resultDic[@"items"];
            
            NSMutableArray *repositories = [NSMutableArray array];
            for(NSDictionary *dataDic in resultArray) {
                TCVGitHubRepositoriesModel *repositoriesModel = [TCVGitHubRepositoriesModel yy_modelWithJSON:dataDic];
                [repositories addObject:repositoriesModel];
            }
            success([repositories copy]);
        }
    } failure:^(NSError *error) {
        fail(error);
    }];
}

@end
