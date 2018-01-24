//
//  TCVAccount.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/23.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVAccount.h"

@implementation TCVAccount

- (instancetype)init {
    return [self initWithServiceSupportedType:TCVServiceSupportedTypesGitHub];
}

- (instancetype)initWithServiceSupportedType:(TCVServiceSupportedTypes)serviceSupportedType {
    if(self = [super init]) {
        self.serviceSupportedType = TCVServiceSupportedTypesGitHub;
    }
    return self;
}

@end
