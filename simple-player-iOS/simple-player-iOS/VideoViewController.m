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
    dispatch_source_t _timer;
}
@property (weak, nonatomic) IBOutlet UILabel *videoSteamTime;
@property (weak, nonatomic) IBOutlet UILabel *audioSteamTime;

@end

@implementation VideoViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    dispatch_source_cancel(_timer);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    PJGLKView *playerView = [[PJGLKView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width/16*9)];
    playerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:playerView];
    videoPlayer = av_mallocz(sizeof(VideoState));

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        char *playUrl = "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear1/prog_index.m3u8";
        
        preparePlayerWindow(self->videoPlayer, (__bridge void *)(playerView), playUrl);
        
    });
    

    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.videoSteamTime.text = [self timeToStr:ffp_get_duration(self->videoPlayer)/1000];
             self.videoSteamTime.text = [self timeToStr:ffp_get_current_position(self->videoPlayer)/1000];
            ffp_get_playableBuffed(self->videoPlayer);
        });
    });
    dispatch_resume(_timer);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    ffp_pause(self->videoPlayer);
}
- (void)dealloc{
    NSLog(@"VideoViewController dealloc");
    _timer = nil;
    close_stream(videoPlayer);
}
#pragma mark 时间转换工具
- (NSString *)timeToStr: (long)totalTime {
    NSString *totalStr = nil;
    NSInteger time = (NSInteger)totalTime;
    if (time < 60) {
        //秒
        totalStr = [NSString stringWithFormat:@"00:00:%02ld", (long)time];
    } else if (time >= 60 && time < 60 * 60) {
        //分钟
        totalStr = [NSString stringWithFormat:@"00:%02ld:%02ld", (long)time / 60, (long)time % 60];
    } else if (time >= 60 * 60) {
        //小时
        totalStr = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)time / (60 * 60), ((long)time % (60 * 60)) / 60, (long)time % 60];
    }
    return totalStr;
}

@end
