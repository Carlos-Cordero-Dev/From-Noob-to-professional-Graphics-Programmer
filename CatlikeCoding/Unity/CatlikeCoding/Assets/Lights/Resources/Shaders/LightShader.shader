// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/LightShader"
{
	Properties
	{
		_Tint("Tint", Color) = (1, 1, 1, 1)
		_MainTex("Texture", 2D) = "white" {}
	}

	SubShader
	{
		Pass {
			Tags {
				"LightMode" = "ForwardBase"
			}
			CGPROGRAM

			#pragma vertex MyVertexProgram
			#pragma fragment MyFragmentProgram

			//#include "UnityCG.cginc" already included in the file below
			#include "UnityStandardBRDF.cginc"

			float4 _Tint;
			sampler2D _MainTex;
			float4 _MainTex_ST; //comes implicit with the sampler2D

			struct VertexData {
				float4 position : POSITION;
				float3 normal : NORMAL;
				float2 uv : TEXCOORD0;
			};

			struct Interpolators {
				//better name: fragment data
				float4 position : SV_POSITION;
				float2 uv : TEXCOORD0;
				float3 normal : TEXCOORD1;
			};

			Interpolators MyVertexProgram(VertexData v) {
				Interpolators i;
				i.position = UnityObjectToClipPos(v.position);
				i.normal = UnityObjectToWorldNormal(v.normal);
				i.uv = TRANSFORM_TEX(v.uv, _MainTex);
				return i;
			}

			float4 MyFragmentProgram(Interpolators i) : SV_TARGET{
				i.normal = normalize(i.normal);
				float3 lightDir = _WorldSpaceLightPos0.xyz;
				return DotClamped(lightDir, i.normal);
			}
			ENDCG
		}
	}
}
