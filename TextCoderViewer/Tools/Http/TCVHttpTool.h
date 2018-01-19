//
//  TCVHttpTool.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/17.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface TCVHttpTool : NSObject

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params  success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

+ (void)putWithURL:(NSString *)url params:(NSDictionary *)params  success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

+ (void)deleteWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

+ (void)downloadTaskWithURL:(NSString *)url success:(void (^)(NSURL *filePath))success failure:(void (^)(NSError *error))failure;


@end
