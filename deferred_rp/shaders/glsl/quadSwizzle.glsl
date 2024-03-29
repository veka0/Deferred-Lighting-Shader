// Copyright (c) Veka0
// All code licensed under the MIT license


// Quad Swizzling GLSL library
// This library mimics functionality of existing extensions
// by utilizing derivative functions dFdx/dFdy to exchange
// data between fragments within 2x2 quads.


// Quad swizzle position
// Is a vector that's useful in computation of swizzling
// functions, and it can be pre-computed and passed into
// functions for better performance.


// Quad swizzling index
// Swizzling index is an integer value between 0 and 3 that
// indicates which swizzling function needs to be used to share
// the value of that fragment. Swizzling of index 3 is unsupported.


// Swizzling function syntax overview:

// quadSwizzle0/1/2(genType value)
// quadSwizzle0/1/2(genType value, vec3 pos)
// quadSwizzle0/1(genType value, float pos_x)
// quadSwizzle2(genType value, vec2 pos_yz)


// Utility functions:

// Returns quad swizzling position.
vec3 quadSwizzlePos() {
	vec3 p;
	p.xy = mod(gl_FragCoord.xy-0.5, 2.0);
	p.x = dFdx(p.x) == -1.0 ? 1.0-p.x : p.x;
	p.y = dFdy(p.y) == -1.0 ? 1.0-p.y : p.y;
	p.z = dFdx(p.x*p.y);
	return p;
}


// Swizzling functions

// float
float quadSwizzle0(float value) { float p = mod(gl_FragCoord.x-0.5, 2.0); return dFdx((dFdx(p) == -1.0 ? 1.0-p : p)*value); }
float quadSwizzle0(float value, vec3 pos) { return dFdx(pos.x*value); }
float quadSwizzle0(float value, float pos_x) { return dFdx(pos_x*value); }

float quadSwizzle1(float value) { float p = mod(gl_FragCoord.x-0.5, 2.0); return -dFdx((dFdx(p) == 1.0 ? 1.0-p : p)*value); }
float quadSwizzle1(float value, vec3 pos) { return -dFdx((1.0-pos.x)*value); }
float quadSwizzle1(float value, float pos_x) { return -dFdx((1.0-pos_x)*value); }

float quadSwizzle2(float value) { vec3 p = quadSwizzlePos(); return mix(dFdy(p.y*value), -dFdy((1.0-p.y)*value), p.z); }
float quadSwizzle2(float value, vec3 pos) { return mix(dFdy(pos.y*value), -dFdy((1.0-pos.y)*value), pos.z); }
float quadSwizzle2(float value, vec2 pos_yz) { return mix(dFdy(pos_yz.x*value), -dFdy((1.0-pos_yz.x)*value), pos_yz.y); }

// vec2
vec2 quadSwizzle0(vec2 value) { float p = mod(gl_FragCoord.x-0.5, 2.0); return dFdx((dFdx(p) == -1.0 ? 1.0-p : p)*value); }
vec2 quadSwizzle0(vec2 value, vec3 pos) { return dFdx(pos.x*value); }
vec2 quadSwizzle0(vec2 value, float pos_x) { return dFdx(pos_x*value); }

vec2 quadSwizzle1(vec2 value) { float p = mod(gl_FragCoord.x-0.5, 2.0); return -dFdx((dFdx(p) == 1.0 ? 1.0-p : p)*value); }
vec2 quadSwizzle1(vec2 value, vec3 pos) { return -dFdx((1.0-pos.x)*value); }
vec2 quadSwizzle1(vec2 value, float pos_x) { return -dFdx((1.0-pos_x)*value); }

vec2 quadSwizzle2(vec2 value) { vec3 p = quadSwizzlePos(); return mix(dFdy(p.y*value), -dFdy((1.0-p.y)*value), p.z); }
vec2 quadSwizzle2(vec2 value, vec3 pos) { return mix(dFdy(pos.y*value), -dFdy((1.0-pos.y)*value), pos.z); }
vec2 quadSwizzle2(vec2 value, vec2 pos_yz) { return mix(dFdy(pos_yz.x*value), -dFdy((1.0-pos_yz.x)*value), pos_yz.y); }

// vec3
vec3 quadSwizzle0(vec3 value) { float p = mod(gl_FragCoord.x-0.5, 2.0); return dFdx((dFdx(p) == -1.0 ? 1.0-p : p)*value); }
vec3 quadSwizzle0(vec3 value, vec3 pos) { return dFdx(pos.x*value); }
vec3 quadSwizzle0(vec3 value, float pos_x) { return dFdx(pos_x*value); }

vec3 quadSwizzle1(vec3 value) { float p = mod(gl_FragCoord.x-0.5, 2.0); return -dFdx((dFdx(p) == 1.0 ? 1.0-p : p)*value); }
vec3 quadSwizzle1(vec3 value, vec3 pos) { return -dFdx((1.0-pos.x)*value); }
vec3 quadSwizzle1(vec3 value, float pos_x) { return -dFdx((1.0-pos_x)*value); }

vec3 quadSwizzle2(vec3 value) { vec3 p = quadSwizzlePos(); return mix(dFdy(p.y*value), -dFdy((1.0-p.y)*value), p.z); }
vec3 quadSwizzle2(vec3 value, vec3 pos) { return mix(dFdy(pos.y*value), -dFdy((1.0-pos.y)*value), pos.z); }
vec3 quadSwizzle2(vec3 value, vec2 pos_yz) { return mix(dFdy(pos_yz.x*value), -dFdy((1.0-pos_yz.x)*value), pos_yz.y); }

// vec4
vec4 quadSwizzle0(vec4 value) { float p = mod(gl_FragCoord.x-0.5, 2.0); return dFdx((dFdx(p) == -1.0 ? 1.0-p : p)*value); }
vec4 quadSwizzle0(vec4 value, vec3 pos) { return dFdx(pos.x*value); }
vec4 quadSwizzle0(vec4 value, float pos_x) { return dFdx(pos_x*value); }

vec4 quadSwizzle1(vec4 value) { float p = mod(gl_FragCoord.x-0.5, 2.0); return -dFdx((dFdx(p) == 1.0 ? 1.0-p : p)*value); }
vec4 quadSwizzle1(vec4 value, vec3 pos) { return -dFdx((1.0-pos.x)*value); }
vec4 quadSwizzle1(vec4 value, float pos_x) { return -dFdx((1.0-pos_x)*value); }

vec4 quadSwizzle2(vec4 value) { vec3 p = quadSwizzlePos(); return mix(dFdy(p.y*value), -dFdy((1.0-p.y)*value), p.z); }
vec4 quadSwizzle2(vec4 value, vec3 pos) { return mix(dFdy(pos.y*value), -dFdy((1.0-pos.y)*value), pos.z); }
vec4 quadSwizzle2(vec4 value, vec2 pos_yz) { return mix(dFdy(pos_yz.x*value), -dFdy((1.0-pos_yz.x)*value), pos_yz.y); }

// Returns swizzling index - 0 to 3 (swizzling of 3 is unsupported).
int quadSwizzleIndex(vec3 pos) {
	int index = pos == quadSwizzle0(pos, pos) ? 0 : 3;
	index = pos == quadSwizzle1(pos, pos) ? 1 : index;
	index = pos == quadSwizzle2(pos, pos) ? 2 : index;
	return index;
}

int quadSwizzleIndex() {
	vec3 pos = quadSwizzlePos();
	int index = pos == quadSwizzle0(pos, pos) ? 0 : 3;
	index = pos == quadSwizzle1(pos, pos) ? 1 : index;
	index = pos == quadSwizzle2(pos, pos) ? 2 : index;
	return index;
}
