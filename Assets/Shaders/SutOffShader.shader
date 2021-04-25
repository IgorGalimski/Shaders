Shader "My/CutOffShader" {
	
	Properties {
	     _rimColor ("Example Texture", Color) = (0.0, 0.5, 0.5, 0.0)
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float3 viewDir;
			};

			float4 _rimColor;
			
			void surf (Input IN, inout SurfaceOutput o){
				half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
				o.Emission = _rimColor.rgb * (rim > 0.75 ? 1 : 0);
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}