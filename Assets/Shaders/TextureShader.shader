Shader "My/TexureShader" {
	
	Properties {
	     _myTex ("Example Texture", 2D) = "white" {}
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float2 uv_myTex;
			};

			sampler2D _myTex;
			
			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = tex2D(_myTex, IN.uv_myTex).rbg;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}