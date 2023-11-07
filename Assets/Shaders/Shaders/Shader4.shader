Shader "Custom/Shader4"
{
    Properties
    {
        _MyColor("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        struct Input
        {
            float3 color : COLOR;
        };

        float4 _MyColor;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _MyColor.rgb;
            o.Alpha = _MyColor.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
