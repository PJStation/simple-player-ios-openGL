//
//  compileShaderTool.h
//  simple-player-iOS
//
//  Created by 孙鹏举 on 2018/11/7.
//  Copyright © 2018年 孙鹏举. All rights reserved.
//

#ifndef compileShaderTool_h
#define compileShaderTool_h

#include <stdio.h>
#include <OpenGLES/ES2/gl.h>
#include <Foundation/Foundation.h>

#define GLES2_MAX_PLANE 3

GLuint compileShader(NSString *shaderName, GLenum shaderType);

#endif /* compileShaderTool_h */
