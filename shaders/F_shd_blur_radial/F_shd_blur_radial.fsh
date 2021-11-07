varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 pos;
const int Quality = 20;

void main()
{
	vec4 Color;
	float v;
	
	//Taking the average of the entire image at many different scales.
  for (float i = 0.0; i < 1.0; i += 1.0 / float(Quality))
	{
		v = 0.9 + i * 0.1;
		Color += texture2D(gm_BaseTexture, (v_vTexcoord * v) + (pos * (1.0 - v)));
	}
	Color /= float(Quality);
	gl_FragColor = Color * v_vColour;
}
