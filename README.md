# Shader Practice
## Overview
This project includes a selection of simple GLSL shaders, implemented into an example project in GameMaker Studio 2. The purpose of this project is to demonstrate the basics of what is possible with GLSL, including color transformation, blur, random noise, and the use of shader uniforms. These shaders were written using tutorials written by Xor Dev, which are available [here](https://xorshaders.weebly.com/tutorials/category/all) and [here](https://gmshaders.com/).

There are some examples shown here, and the rest can be viewed by loading the project in GameMaker Studio 2, or downloading the sample project under releases.

## Project Organization
The shader code is contained in a GameMaker Studio 2 .yyp file. Each effect is contained under the Shaders group, labeled A through I. The application of each effect is handled by the ``obj_test`` object. In the Create event, each shader is added to an ``effects`` array. Any required uniforms are defined as well. In the Draw End event, the uniforms are applied, and the main surface is drawn. (The application surface is disabled). The ``obj_test`` handles all the inputs for changing or toggling effects. Finally, there are four backgrounds included under the Sprites group. These images are taken from another project and and here only as examples.

## Shaders
Here are several of the shaders included in this project, including explanations, code snippets, and comparison images.
### Effect 01: Intensify
Makes the image brighter, by increasing the value of each color by 50%.

```
gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
gl_FragColor.rgb *= vec3(1.5, 1.5, 1.5);
```

01<br>
<img src="/gitassets/Base-4.png" width="48%"> <img src="/gitassets/Shd-1-4.png" width="48%"><br>

### Effect 02: Black and White
Makes the image grayscale, by calculating the dot-product with a brightness correction vector.

```
vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);
vec3 Luma = vec3(0.299, 0.587, 0.114);
gl_FragColor = vec4(vec3(dot(Color.rbg, Luma)), Color.a);
```

The luma vector chosen is explained [here](https://en.wikipedia.org/wiki/HSL_and_HSV#Lightness). The luma vector is to correct for the way human perception sees some colors as brighter than others. For this reason, simply taking the average of all three color channels is not quite correct.

This shader can be modified to create filters for certain colors, such as sepia-tone which is included in Effect 03.

02<br>
<img src="/gitassets/Base-2.png" width="48%"> <img src="/gitassets/Shd-2-2.png" width="48%"><br>
03<br>
<img src="/gitassets/Base-1.png" width="48%"> <img src="/gitassets/Shd-3-1.png" width="48%"><br>

### Effect 04: Invert Colors
Inverts the colors of the image, simply by negating the RGB component.

```
vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);
gl_FragColor = vec4(vec3(1.0) - Color.rgb, Color.a);
```

04<br>
<img src="/gitassets/Base-3.png" width="48%"> <img src="/gitassets/Shd-4-3.png" width="48%"><br>

### Effect 05: Random Noise
Generates a layer of random interpolated noise. The color is adjusted so it looks like fog. To create a smooth noise texture, it requires sampling and interpolating random values over many iterations. Please view the source code for details.

05<br>
<img src="/gitassets/Base-2.png" width="48%"> <img src="/gitassets/Shd-5-2.png" width="48%"><br>

### Effect 08: Gaussian Blur
Blurs the image, by combining the average of all the points in an area around each point. The quality can be increased by sampling more points. Gaussian blur is effectively a combination of radial blur and linear blur, which are shown in Effect 06 and Effect 07.

06<br>
<img src="/gitassets/Base-1.png" width="48%"> <img src="/gitassets/Shd-6-1.png" width="48%"><br>
07<br>
<img src="/gitassets/Base-4.png" width="48%"> <img src="/gitassets/Shd-7-4.png" width="48%"><br>
08<br>
<img src="/gitassets/Base-3.png" width="48%"> <img src="/gitassets/Shd-8-3.png" width="48%"><br>

### Effect 09: Ripple
Causes ripple distortions in the image. Uses a time uniform to allow the ripple to be animated. (Animation not shown here). The basis of the ripple effect is a cosine wave, modified by defined wavlength, amplitude, and time uniform.

```
vec2 Coord = v_vTexcoord + vec2(cos((v_vTexcoord.y * wavl) + (time * Pi)) / ampl, 0.0);
gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord);
```

09<br>
<img src="/gitassets/Base-2.png" width="48%"> <img src="/gitassets/Shd-9-2.png" width="48%"><br>

## Conclusion
This project served primarily as practice for myself. First, I learned the basics of fragment shaders in GLSL, and applied them to a GML game project. Additionally, I became more familiar with markup and Github, as I wrote this README. I will continue to write more shaders in the future, and I may add them to this project as I continue, to serve as a showcase for my understanding of GLSL.
