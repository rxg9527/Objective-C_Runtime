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
}

@end
