Shader "Custom/P6_02_UV"
{
    Properties
    {
        _UV_X ("UV (X)", Range(0,1)) = 0
        _UV_Y ("UV (Y)", Range(0,1)) = 0
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        float _UV_X;
        float _UV_Y;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = float2(IN.uv_MainTex.x + _UV_X, IN.uv_MainTex.y + _UV_Y);
            fixed4 c = tex2D (_MainTex, uv);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
