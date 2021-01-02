attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D tex0;
uniform sampler2D tex1;
varying vec2 v_vTexcoord;
void main() {
 vec4 mixer=texture2D(tex0,v_vTexcoord);
 if ( mixer.a == 0.0 ) gl_FragColor=texture2D(tex1,v_vTexcoord);
 else gl_FragColor=vec4(0.0,0.0,0.0,0.0);
}
