//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer ConstantBuffer
// {
//
//   float4x4 World;                    // Offset:    0 Size:    64 [unused]
//   float4x4 View;                     // Offset:   64 Size:    64 [unused]
//   float4x4 Proj;                     // Offset:  128 Size:    64 [unused]
//   float4 vLightDir[2];               // Offset:  192 Size:    32
//   float4 vLightColor[2];             // Offset:  224 Size:    32
//   float4 vOutputColor;               // Offset:  256 Size:    16 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// ConstantBuffer                    cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyz         1     NONE   float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed | skipOptimization
dcl_constantbuffer CB0[16], dynamicIndexed
dcl_input_ps linear v1.xyz
dcl_output o0.xyzw
dcl_temps 3
//
// Initial variable locations:
//   v0.x <- input.Pos.x; v0.y <- input.Pos.y; v0.z <- input.Pos.z; v0.w <- input.Pos.w; 
//   v1.x <- input.Norm.x; v1.y <- input.Norm.y; v1.z <- input.Norm.z; 
//   o0.x <- <main return value>.x; o0.y <- <main return value>.y; o0.z <- <main return value>.z; o0.w <- <main return value>.w
//
#line 23 "C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x64\LightPixelShader.hlsl"
itof r0.xyz, l(0, 0, 0, 0)  // r0.x <- finalColor.x; r0.y <- finalColor.y; r0.z <- finalColor.z

#line 26
mov r0.w, l(0)  // r0.w <- i
mov r1.xyz, r0.xyzx  // r1.x <- finalColor.x; r1.y <- finalColor.y; r1.z <- finalColor.z
mov r1.w, r0.w  // r1.w <- i
loop 
  ilt r2.x, r1.w, l(2)
  breakc_z r2.x

#line 28
  dp3 r2.x, cb0[r1.w + 12].xyzx, v1.xyzx
  mul r2.xyz, r2.xxxx, cb0[r1.w + 14].xyzx
  max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  min r2.xyz, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r1.xyz, r1.xyzx, r2.xyzx

#line 29
  iadd r1.w, r1.w, l(1)
endloop 

#line 30
itof r0.x, l(1)  // r0.x <- finalColor.w

#line 31
mov o0.xyz, r1.xyzx
mov o0.w, r0.x
ret 
// Approximately 18 instruction slots used