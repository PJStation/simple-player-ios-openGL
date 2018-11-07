
precision highp float;

varying   highp vec2 vv2_texcoord;

attribute highp vec4 av4_position;
attribute highp vec2 av2_texcoord;

uniform         mat4 um4_matrix;

void main(){
    gl_Position  = um4_matrix * av4_position;
    vv2_texcoord = av2_texcoord;
}
