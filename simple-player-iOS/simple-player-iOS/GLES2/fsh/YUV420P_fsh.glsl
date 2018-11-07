
precision highp float;

uniform highp sampler2D samplerY;
uniform highp sampler2D samplerU;
uniform highp sampler2D samplerV;
varying highp vec2      vv2_texcoord;

void main()
{
    highp float y = texture2D(samplerY, vv2_texcoord).r;
    highp float u = texture2D(samplerU, vv2_texcoord).r - 0.5;
    highp float v = texture2D(samplerV, vv2_texcoord).r - 0.5;
    
    highp float r = y +             1.402 * v;
    highp float g = y - 0.344 * u - 0.714 * v;
    highp float b = y + 1.772 * u;
    
    
    gl_FragColor = vec4(r, g, b, 1.0);
}
