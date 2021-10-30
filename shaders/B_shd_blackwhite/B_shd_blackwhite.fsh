//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
		float val = (gl_FragColor.r + gl_FragColor.g + gl_FragColor.b) * 0.25;
		gl_FragColor.rbg = vec3(val, val, val);
}
