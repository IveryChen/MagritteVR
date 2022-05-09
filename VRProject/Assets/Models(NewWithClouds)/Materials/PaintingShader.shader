Shader "Unlit/PaintingShader"
{
	//show values to edit in inspector
	Properties{
		_MainTex("Texture", 2D) = "white" {}
		[IntRange] _StencilRef("Stencil Reference Value", Range(0,255)) = 0
	}

		SubShader{
		//the material is completely non-transparent and is rendered at the same time as the other opaque geometry
		Tags{ "RenderType" = "Opaque" "Queue" = "Geometry-1"}

		//stencil operation
		Stencil{
			Ref 1
			Comp Always
			Pass Replace
		}

		Pass{
				//don't draw color or depth
				Blend Zero One
				ZWrite Off

				CGPROGRAM
				#include "UnityCG.cginc"

				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog


				struct appdata {
					float4 vertex : POSITION;

				};

				struct v2f {
					float4 position : SV_POSITION;
				};

				v2f vert(appdata v) {
					v2f o;
					//calculate the position in clip space to render the object
					o.position = UnityObjectToClipPos(v.vertex);
					return o;
				}

				fixed4 frag(v2f i) : SV_TARGET{
					// sample the texture
			  // fixed4 col = tex2D(_MainTex, i.uv);
				// apply fog
			 //  UNITY_APPLY_FOG(i.fogCoord, col);
			//	return col; }
					return 0;
				}

				ENDCG
			}
	}
}