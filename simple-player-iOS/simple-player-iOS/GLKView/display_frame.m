//
//  display_frame.c
//  simple-player-iOS
//
//  Created by 孙鹏举 on 2018/11/7.
//  Copyright © 2018年 孙鹏举. All rights reserved.
//

#include "display_frame.h"
#include "PJGLKView.h"
void display_frame(void *view,VideoFrame *frame){
    @autoreleasepool {
        PJGLKView *glkView = view;
        [glkView display_frame:frame];
    }
  
}
