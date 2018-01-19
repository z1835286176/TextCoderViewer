//
//  TCVDataTool.h
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/16.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Singleton.h"

@interface TCVDataTool : NSObject

singleton_interface(TCVDataTool);

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
