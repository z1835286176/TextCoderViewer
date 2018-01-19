//
//  TCVServiceSupportedModel.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/18.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TCVAccountConnectTypes) {
    TCVAccountConnectTypesFTP,
    TCVAccountConnectTypesGitHub,
    TCVAccountConnectTypesBitbucket, // comming soon
    TCVAccountConnectTypesDropbox, // comming soon
};

@interface TCVServiceSupportedModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) int type;

@end
