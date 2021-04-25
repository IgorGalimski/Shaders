Shader "My/RimShader" {
	
	Properties {
	     _rimColor ("Example Texture", Color) = (0.0, 0.5, 0.5, 0.0)
	     _multiplier ("Rim Multiplier", int) = 1
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float3 viewDir;
			};

			float4 _rimColor;
			int _multiplier; 
			
			void surf (Input IN, inout SurfaceOutput o){
				half rim = 1 - dot(normalize(IN.viewDir), o.Normal);
				o.Emission = _rimColor.rgb * pow(rim, _multiplier);
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}