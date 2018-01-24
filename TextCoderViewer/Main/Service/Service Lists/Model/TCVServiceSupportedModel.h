//
//  TCVServiceSupportedModel.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/18.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TCVServiceSupportedTypes) {
    TCVServiceSupportedTypesFTP,
    TCVServiceSupportedTypesGitHub,
    TCVServiceSupportedTypesBitbucket, // comming soon
    TCVServiceSupportedTypesDropbox, // comming soon
};

typedef NS_ENUM(NSInteger, TCVServiceSupportedReady) {
    TCVServiceSupportedReadyNO,
    TCVServiceSupportedReadyYES,
};

/** 这个只是本项目支持的服务, 暂时只有四个 */
@interface TCVServiceSupportedModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *nameIcon;
@property (nonatomic, assign) TCVServiceSupportedTypes type;
@property (nonatomic, assign) TCVServiceSupportedReady readyStatus;

@end
