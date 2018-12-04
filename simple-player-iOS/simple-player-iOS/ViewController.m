//
//  ViewController.m
//  simple-player-iOS
//
//  Created by 孙鹏举 on 2018/10/11.
//  Copyright © 2018年 孙鹏举. All rights reserved.
//

#import "ViewController.h"
#import <VideoToolbox/VideoToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <GameController/GameController.h>
#import <CoreMotion/CoreMotion.h>

#include "ffplay.h"
#import "PJGLKView.h"
#import "display_frame.h"
@interface ViewController (){
    VideoState *videoPlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PJGLKView *playerView = [[PJGLKView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width/16*9)];
    playerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:playerView];
    videoPlayer = av_mallocz(sizeof(VideoState));
    char *playUrl = "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear1/prog_index.m3u8";
    preparePlayerWindow(videoPlayer, (__bridge void *)(playerView), playUrl);
}


- (void)dealloc{
    close_stream(videoPlayer);
}

@end
