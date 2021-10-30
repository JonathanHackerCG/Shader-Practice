/// Fragment Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

float rand(vec2 p)
{
	//Simple randomization function with constant values.
	return fract(cos(dot(p, vec2(5.237, 6.378))) * 8463.648);	
	//fract: Returns the fractional component of the input float.
	//dot: Returns the dot product of two vectors.
}


float noise(vec2 p)
{
	//Interpolate (Top Left and Top Right)
	float x1 = rand(vec2(floor(p.x), floor(p.y)));
	float x2 = rand(vec2(ceil(p.x),  floor(p.y)));
	float top = mix(x1, x2, smoothstep(0.0, 1.0, fract(p.x)));
	
	//Interpolate (Bottom Left and Bottom Right)
	x1 = rand(vec2(floor(p.x), ceil(p.y)));
	x2 = rand(vec2(ceil(p.x),  ceil(p.y)));
	float bottom = mix(x1, x2, smoothstep(0.0, 1.0, fract(p.x)));
	
	//Smoothly mix the top and bottom values.
	return mix(top, bottom, smoothstep(0.0, 1.0, fract(p.y)));
}

void main()
{
	//Combine 8 layers of noise at different scale factors.
	float n = (noise(v_vPosition / 4.000) * 0.1) +
						(noise(v_vPosition / 8.000) * 0.1) +
						(noise(v_vPosition / 16.00) * 0.1) +
						(noise(v_vPosition / 32.00) * 0.1) +
						(noise(v_vPosition / 64.00) * 0.1) +
						(noise(v_vPosition / 128.0) * 0.1) +
						(noise(v_vPosition / 256.0) * 0.2) +
						(noise(v_vPosition / 512.0) * 0.2);
	
	//Output the color of each pixel modified by the noise.
	vec4 Color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor = Color + vec4(vec3(n) * 0.3, 0.0);
}
