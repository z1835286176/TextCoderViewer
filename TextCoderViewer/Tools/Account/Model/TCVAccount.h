//
//  TCVAccount.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/23.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCVAccount : NSObject

@property (nonatomic, assign) TCVServiceSupportedTypes serviceSupportedType;

- (instancetype)initWithServiceSupportedType:(TCVServiceSupportedTypes)serviceSupportedType;

@end
