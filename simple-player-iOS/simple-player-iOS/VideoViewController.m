//
//  VideoViewController.m
//  simple-player-iOS
//
//  Created by 孙鹏举 on 2019/2/18.
//  Copyright © 2019年 孙鹏举. All rights reserved.
//

#import "VideoViewController.h"
#import <VideoToolbox/VideoToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <GameController/GameController.h>
#import <CoreMotion/CoreMotion.h>

#include "ffplay.h"
#import "PJGLKView.h"
#import "display_frame.h"
@interface VideoViewController () {
    VideoState *videoPlayer;
}
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    PJGLKView *playerView = [[PJGLKView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width/16*9)];
    playerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:playerView];
    videoPlayer = av_mallocz(sizeof(VideoState));
    char *playUrl = "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear1/prog_index.m3u8";
  
    
    preparePlayerWindow(videoPlayer, (__bridge void *)(playerView), playUrl);
    
}

- (void)dealloc{
    NSLog(@"VideoViewController dealloc");
    close_stream(videoPlayer);
}


@end
