varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float wavl = 32.0;
const float ampl = 256.0;
const float Pi = 6.28318530718; //2 Pi

uniform float time;

void main()
{
	vec2 Coord = v_vTexcoord + vec2(cos((v_vTexcoord.y * wavl) + (time * Pi)) / ampl, 0.0);
  gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord);
}
