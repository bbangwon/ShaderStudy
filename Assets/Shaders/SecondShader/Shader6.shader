Shader "Custom/Shader6"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo2 (RGB)", 2D) = "white" {}
        _AlphaTex ("AlphaTex (RGB)", 2D) = "white" {}
        _Lerp("Lerp", Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM

        #pragma surface surf Standard

        sampler2D _MainTex;
        sampler2D _MainTex2;
        sampler2D _AlphaTex;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
            float2 uv_AlphaTex;
        };

        float _Lerp;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);
            fixed4 e = tex2D (_AlphaTex, IN.uv_AlphaTex);

            float lerpVal = (e.r + e.g + e.b) / 3;

            o.Albedo = lerp(c.rgb, d.rgb, lerpVal);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
