
//
//  TCVShowDocumentVC.m
//  TextCoderViewer
//
//  Created by istLZP on 2018/1/16.
//  Copyright © 2018年 Garenge. All rights reserved.
//

#import "TCVShowDocumentVC.h"

@interface TCVShowDocumentVC ()

/** 暂且用UITextView显示数据, 显示加编辑 */
@property (nonatomic, strong) UITextView *textView;

@end

@implementation TCVShowDocumentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.fileModel.name;
    [self createTextView];
    [self prepareData];
}

- (void)createTextView {
    // 底部留有工具栏
    CGRect textViewFrame = CGRectMake(0, 0, self.view.pp_width, self.view.pp_height - 40);
    // CGSize textViewSize = CGSizeMake(self.view.pp_width, self.view.pp_height - 40);
    // NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:textViewSize];
    // UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame textContainer:textContainer];
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    [textView setFont:[UIFont systemFontOfSize:15]];
    textView.layer.borderWidth = 1;
    textView.scrollEnabled     = YES;
    textView.editable          = YES;
    [self.view addSubview:textView];
    
    self.textView = textView;
}

// 处理数据
- (void)prepareData {
    if(nil == self.fileModel) {
        return;
    }
    NSString *filePath = [PPFileManager getPathInDocumentDirectoryWithComponent:self.fileModel.relativePath];
    
    NSError *getStringError = nil;
    NSStringEncoding stringEncoding = NSUTF8StringEncoding;
    NSString *fileContent = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:filePath] usedEncoding:&stringEncoding error:&getStringError];
    if(nil == getStringError) {
        // 没问题
        self.textView.text = fileContent;
    } else {
        NSLog(@"读取文件_%@出错:%@", self.fileModel.relativePath, getStringError);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
