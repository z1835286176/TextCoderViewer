//
//  TCVGitHubApiSDK.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/25.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCVGitHubApiSDK : NSObject

/** 查询 */
NSString *GitHubApi_Search_repositories(void);
+ (void)queryRepositoriesWithParameters:(NSDictionary *)params success:(void(^)(NSArray *results))success fail:(void(^)(NSError *error))fail;

@end
