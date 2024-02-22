// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/MultipleLightPasses"
{
	Properties
	{
		_Tint("Tint", Color) = (1, 1, 1, 1)
		_MainTex("Albedo", 2D) = "white" {}
		[Gamma] _Metallic("Metallic", Range(0, 1)) = 0
		_Smoothness("Smoothness", Range(0, 1)) = 0.5
	}

	SubShader
	{
		Pass {
			Tags {
				"LightMode" = "ForwardBase"
			}
			CGPROGRAM

			#pragma target 3.0

			#pragma multi_compile _ VERTEXLIGHT_ON

			#pragma vertex MyVertexProgram
			#pragma fragment MyFragmentProgram
			
			#define FORWARD_BASE_PASS

			#include "Lighting_includes.cginc"
			
			ENDCG
		}

		Pass {
			Tags {
				"LightMode" = "ForwardAdd"
			}
			//aditive blending
			Blend One One
			ZWrite Off

			CGPROGRAM

			#pragma target 3.0	

			#pragma vertex MyVertexProgram
			#pragma fragment MyFragmentProgram
			
			//short for #pragma multi_compile DIRECTIONAL DIRECTIONAL_COOKIE POINT POINT_COOKIE SPOT
			#pragma multi_compile_fwdadd

			#include "Lighting_includes.cginc"

			ENDCG
		}
	}
}
