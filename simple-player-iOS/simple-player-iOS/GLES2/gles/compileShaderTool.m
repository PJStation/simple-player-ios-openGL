//
//  compileShaderTool.c
//  simple-player-iOS
//
//  Created by 孙鹏举 on 2018/11/7.
//  Copyright © 2018年 孙鹏举. All rights reserved.
//

#include "compileShaderTool.h"


GLuint compileShader(NSString *shaderName, GLenum shaderType) {
    
    NSString *shaderPath = [[NSBundle mainBundle] pathForResource:shaderName ofType:@"glsl"];
    NSError *error;
    NSString *shaderString = [NSString stringWithContentsOfFile:shaderPath encoding:NSUTF8StringEncoding error:&error];
    if (!shaderString) {
        NSLog(@"Error loading shader: %@", error.localizedDescription);
        exit(1);
    }
    GLuint shader = glCreateShader(shaderType);

    const char* shaderStringUTF8 = [shaderString UTF8String];
    GLint shaderStringLength = (GLint)[shaderString length];


    glShaderSource(shader, 1, &shaderStringUTF8, &shaderStringLength);

    glCompileShader(shader);

    GLint compileSuccess;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &compileSuccess);
    if (compileSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetShaderInfoLog(shader, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }

    return shader;
    
}

