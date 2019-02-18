//
//  ViewController.m
//  simple-player-iOS
//
//  Created by 孙鹏举 on 2018/10/11.
//  Copyright © 2018年 孙鹏举. All rights reserved.
//

#import "ViewController.h"
#import "VideoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)playButtonClick:(id)sender {
    VideoViewController *vc = [[VideoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
