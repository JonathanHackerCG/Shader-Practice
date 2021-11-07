varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
		vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);			//Cache the color of the pixel.
		vec3 Luma = vec3(0.299, 0.587, 0.114);										//Brightness correction.
		float bw = dot(Color.rbg, Luma);													//Black and White result.
		//gl_FragColor = vec4(vec3(bw, 0.0, 0.0), Color.a);				//Isolating just red color.
		gl_FragColor = vec4(bw * vec3(1.0, 0.8, 0.4), Color.a);		//Creating a sepia tone.
}
