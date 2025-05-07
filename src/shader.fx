#if OPENGL
#define SV_POSITION POSITION
#define VS_SHADERMODEL vs_3_0
#define PS_SHADERMODEL ps_3_0
#else
#define VS_SHADERMODEL vs_4_0_level_9_1
#define PS_SHADERMODEL ps_4_0_level_9_1
#endif

Texture2D InputTexture;
sampler2D InputTextureSampler = sampler_state
{
    Texture = <InputTexture>;
};

struct VertexShaderOutput
{
    float4 Color : COLOR0;
    float2 TextureCoordinates : TEXCOORD0;
};

float4 MainPS(VertexShaderOutput input) : COLOR
{
    float4 sourceColor = tex2D(InputTextureSampler, input.TextureCoordinates);

    float4 targetColor = sourceColor.bgra;
    targetColor.a = input.Color.a;

    return targetColor;
}

technique T0
{
    pass P0
    {
        PixelShader = compile PS_SHADERMODEL MainPS();
    }
};