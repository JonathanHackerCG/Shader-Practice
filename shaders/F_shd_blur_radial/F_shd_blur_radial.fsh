//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const int Quality = 20;

void main()
{
	vec4 Color;
	float v;
	
  for (float i = 0.0; i < 1.0; i += 1.0 / float(Quality))
	{
		v = 0.9 + i * 0.1;
		Color += texture2D(gm_BaseTexture, (v_vTexcoord * v) + 0.5 - (0.5 * v));
	}
	Color /= float(Quality);
	gl_FragColor = Color * v_vColour;
}
