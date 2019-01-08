//
//  ViewController.m
//  PTDraw
//
//  Created by pt on 2019/1/8.
//  Copyright © 2019年 pt. All rights reserved.
//

#import "ViewController.h"
#import "DrawRectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawRectView *test = [[DrawRectView alloc]initWithFrame:self.view.frame];
    test.backgroundColor=[UIColor blackColor];
    [self.view addSubview:test];
}


@end
