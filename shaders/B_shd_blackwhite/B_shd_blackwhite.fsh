//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
		vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);			//Cache the color of the pixel.
		vec3 Luma = vec3(0.299, 0.587, 0.114);										//Brightness correction. (https://en.wikipedia.org/wiki/HSL_and_HSV)
		gl_FragColor = vec4(vec3(dot(Color.rbg, Luma)), Color.a);	//Set the color to the dot product of Luma and Color.
}
