Shader "Custom/P8_NormalMap"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _BumpMap ("Normalmap", 2D) = "bump" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D _MainTex;
        sampler2D _BumpMap;        

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpMap;
        };

        half _Glossiness;
        half _Metallic;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed3 n = UnpackNormal(tex2D (_BumpMap, IN.uv_BumpMap));
            o.Albedo = c.rgb;
            o.Alpha = c.a;

            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Normal = n;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
