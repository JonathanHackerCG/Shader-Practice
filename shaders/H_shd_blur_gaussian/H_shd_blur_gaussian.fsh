//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 size; //Width, Height, Radius
const int Quality = 12;
const int Directions = 12;
const float Pi = 6.28318530718; //2 Pi

void main()
{
	vec2 radius = size.z / size.xy;
	vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);
	for (float d = 0.0; d < Pi; d += Pi / float(Directions))
	{
	  for (float i = 0.0; i < 1.0; i += 1.0 / float(Quality))
		{
			//Sample in a circle around the position.
			Color += texture2D(gm_BaseTexture, v_vTexcoord + (vec2(cos(d), sin(d)) * radius * i));
		}
	}
	Color /= ((float(Quality) * float(Directions)) + 1.0);
	gl_FragColor = Color * v_vColour;
}
