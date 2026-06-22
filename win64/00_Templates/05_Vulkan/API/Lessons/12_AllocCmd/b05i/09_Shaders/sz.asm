;File Names
szFileNameShaderV db "SPIR-V\triangle.spv",0
szFileNameShaderF db "SPIR-V\fragment.spv",0

;Log
szLogLoadShaderV db "Loading Vertex Shader",0
szLogLoadShaderF db "Loading Fragment Shader",0
szLogVkCreateVertexShader db "vkCreateShaderModule (Vertex)",0
szLogVkDestroyVertexShader db "vkDestroyShaderModule (Vertex)",0
szLogVkCreateFragmentShader db "vkCreateShaderModule (Fragment)",0
szLogVkDestroyFragmentShader db "vkDestroyShaderModule (Fragment)",0

