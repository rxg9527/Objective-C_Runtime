//
//  ViewController.m
//  01-Runtime(消息机制)
//
//  Created by Vincent on 16/8/18.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *
  解决消息机制方法提示步骤
  build setting -> 『Enable Strict Checking of objc_msgSend Calls』改为 NO
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    p = objc_msgSend(p, sel_registerName("init"));
    objc_msgSend(p, @selector(eat));
    objc_msgSend(p, @selector(run:),20);
    
    // 方法调用流程
    // 怎么去调用eat方法 , 对象方法:类对象的方法列表 类方法:元类中方法列表
    // 1.通过isa去对应的类中查找
    // 2.注册方法编号
    // 3.根据方法编号去查找对应方法
    // 4.找到只是最终函数实现地址,根据地址去方法区调用对应函数
}

@end
