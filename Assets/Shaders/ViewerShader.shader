Shader "My/ViewerShader" {
	
	Properties {
	     _myTex ("Example Texture", 2D) = "white" {}
		_myAlbedoTreshold("Albedo Threshold", Range(0, 1)) = 0.05
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float3 viewDir;
			};

			sampler2D _myTex;
			half _myAlbedoTreshold;
			
			void surf (Input IN, inout SurfaceOutput o){
			    half dotp = dot(IN.viewDir, o.Normal);

				float3 albedo;

				if(dotp > _myAlbedoTreshold)
				{
					albedo = float3(0, 0, 0);
				}
				else
				{
					albedo = float3(1,1,1);
				}
				
			    o.Albedo = albedo;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}