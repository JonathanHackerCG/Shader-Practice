//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
		vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);	//Cache the color of the pixel.
		gl_FragColor = vec4(vec3(1.0) - Color.rgb, Color.a);	//Invert the colors of the pixel.
}
