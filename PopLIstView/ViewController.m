//
//  ViewController.m
//  PopLIstView
//
//  Created by ap2 on 15/9/16.
//  Copyright (c) 2015年 ap2. All rights reserved.
//

#import "ViewController.h"
#import "PopLIstView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)avtioncc:(id)sender {
    
    [PopLIstView showWithArr:@[@"1", @"2", @"3"] didSelectBlock:^(NSInteger index) {
       
        NSLog(@"%zi", index);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
