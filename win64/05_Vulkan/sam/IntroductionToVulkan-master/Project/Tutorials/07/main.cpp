////////////////////////////////////////////////////////////////////////////////
// Copyright 2017 Intel Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License.  You may obtain a copy
// of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
// License for the specific language governing permissions and limitations
// under the License.
////////////////////////////////////////////////////////////////////////////////

#include "Tutorial07.h"

int main( int argc, char **argv ) {
  ApiWithoutSecrets::OS::Window window;
  ApiWithoutSecrets::Tutorial07 tutorial07;

  // Window creation
  if( !window.Create( "07 - Uniform Buffers" ) ) {
    return -1;
  }

  // Vulkan preparations and initialization
  if( !tutorial07.PrepareVulkan( window.GetParameters() ) ) {
    return -1;
  }

  // Tutorial 06
  if( !tutorial07.CreateRenderingResources() ) {
    return -1;
  }
  if( !tutorial07.CreateStagingBuffer() ) {
    return -1;
  }
  if( !tutorial07.CreateTexture() ) {
    return -1;
  }
  if( !tutorial07.CreateUniformBuffer() ) {
    return -1;
  }
  if( !tutorial07.CreateDescriptorSetLayout() ) {
    return -1;
  }
  if( !tutorial07.CreateDescriptorPool() ) {
    return -1;
  }
  if( !tutorial07.AllocateDescriptorSet() ) {
    return -1;
  }
  if( !tutorial07.UpdateDescriptorSet() ) {
    return -1;
  }
  if( !tutorial07.CreateRenderPass() ) {
    return -1;
  }
  if( !tutorial07.CreatePipelineLayout() ) {
    return -1;
  }
  if( !tutorial07.CreatePipeline() ) {
    return -1;
  }
  if( !tutorial07.CreateVertexBuffer() ) {
    return -1;
  }

  // Rendering loop
  if( !window.RenderingLoop( tutorial07 ) ) {
    return -1;
  }

  return 0;
}
