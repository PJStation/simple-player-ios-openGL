//
//  PJGLKView.h
//  myVideoPlayer
//
//  Created by 孙鹏举 on 2018/9/10.
//  Copyright © 2018年 孙鹏举. All rights reserved.
//


#import <GLKit/GLKit.h>
#include <libavutil/frame.h>
#include <libavutil/pixfmt.h>
#import "display_frame.h"

@interface PJGLKView : GLKView
- (void)display_frame:(VideoFrame *)frame;


@end
