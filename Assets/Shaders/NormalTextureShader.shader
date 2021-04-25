Shader "My/NormalTexureShader" {
	
	Properties {
	     _myTex ("Example Texture", 2D) = "white" {}
		 _myNormalTex ("Normal Texture", 2D) = "white" {}
		 _myNormalSlider ("Normal Slider", Range(-10, 10)) = 1
	     _myNormalScale ("Normal Scale", Range(0, 2)) = 1
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float2 uv_myTex;
				float2 uv_myNormalTex;
			};

			sampler2D _myTex;
			sampler2D _myNormalTex;
			half _myNormalSlider;
			half _myNormalScale;
			
			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = tex2D(_myTex, IN.uv_myTex*_myNormalScale).rbg;
			    o.Normal = UnpackNormal(tex2D(_myNormalTex, IN.uv_myNormalTex*_myNormalScale)) * float3(_myNormalSlider, _myNormalSlider, 1);
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}