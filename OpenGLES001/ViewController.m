//
//  ViewController.m
//  OpenGLES001
//
//  Created by lvjianxiong on 2020/7/26.
//  Copyright © 2020 lvjianxiong. All rights reserved.
//

#import "ViewController.h"
#import <OpenGLES/ES3/gl.h>
#import <OpenGLES/ES3/glext.h>

@interface ViewController (){
    EAGLContext *context;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1. 初始化上下文context ,Apple不支持EGL，所以需要使用EAGL
    context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    //2. 判断是否成功
    if (!context) {
        NSLog(@"content初始化失败");
        return;
    }
    //3. 上下文可以有多个，但是当前上下文只能有1个
    [EAGLContext setCurrentContext:context];
    //4. GLKView
    GLKView *view = (GLKView *)self.view;
    //设置GLKView的上下文
    view.context = context;
    glClearColor(1, 0, 0, 1);
}

#pragma mark- GLKViewDelegate
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    glClear(GL_COLOR_BUFFER_BIT);
}


@end
