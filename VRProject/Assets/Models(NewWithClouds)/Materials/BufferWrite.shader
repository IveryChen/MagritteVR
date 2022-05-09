Shader "Unlit/BufferWrite"
{
	Properties{
			_Color("Tint", Color) = (0, 0, 0, 1)
			_MainTex("Texture", 2D) = "white" {}
			_Smoothness("Smoothness", Range(0, 1)) = 0
			_Metallic("Metalness", Range(0, 1)) = 0
			[HDR] _Emission("Emission", color) = (0,0,0)

			[IntRange] _StencilRef("Stencil Reference Value", Range(0,255)) = 0
	}
		SubShader{
			Tags{ "RenderType" = "Opaque" "Queue" = "Geometry"}

			//stencil operation
			Stencil{
				Ref 1
				Comp Equal
			}

			CGPROGRAM

			#pragma surface surf Standard fullforwardshadows
			#pragma target 3.0

			sampler2D _MainTex;
			fixed4 _Color;

			half _Smoothness;
			half _Metallic;
			half3 _Emission;

			struct Input {
				float2 uv_MainTex;
			};

			void surf(Input i, inout SurfaceOutputStandard o) {
				fixed4 col = tex2D(_MainTex, i.uv_MainTex);
				col *= _Color;
				o.Albedo = col.rgb;
				o.Metallic = _Metallic;
				o.Smoothness = _Smoothness;
				o.Emission = _Emission;
			}

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
					float4 vertex : SV_POSITION;
			};

		//	sampler2D _MainTex;
		//	float4 _MainTex_ST;

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				//o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o, o.vertex);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
			// apply fog
			UNITY_APPLY_FOG(i.fogCoord, col);
			return col;
			}

			ENDCG
			}
				FallBack "Standard"
}