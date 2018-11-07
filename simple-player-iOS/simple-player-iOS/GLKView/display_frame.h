//
//  display_frame.h
//  simple-player-iOS
//
//  Created by 孙鹏举 on 2018/11/7.
//  Copyright © 2018年 孙鹏举. All rights reserved.
//

#ifndef display_frame_h
#define display_frame_h

#include <stdio.h>
#include <libavutil/frame.h>
#include <MacTypes.h>

typedef struct VideoFrame VideoFrame;

struct VideoFrame {
    int width;
    int height;
    UInt8 *pixels[AV_NUM_DATA_POINTERS];
    int pitches[AV_NUM_DATA_POINTERS];
    int planar;
    enum AVPixelFormat format;
};
void display_frame(void *view,VideoFrame *frame);
#endif /* display_frame_h */
