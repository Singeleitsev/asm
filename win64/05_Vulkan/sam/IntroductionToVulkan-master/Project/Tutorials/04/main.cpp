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

#include "Tutorial04.h"

int main( int argc, char **argv ) {
  ApiWithoutSecrets::OS::Window window;
  ApiWithoutSecrets::Tutorial04 tutorial04;

  // Window creation
  if( !window.Create( "04 - Vertex Attributes" ) ) {
    return -1;
  }

  // Vulkan preparations and initialization
  if( !tutorial04.PrepareVulkan( window.GetParameters() ) ) {
    return -1;
  }

  // Tutorial 04
  if( !tutorial04.CreateRenderPass() ) {
    return -1;
  }
  if( !tutorial04.CreatePipeline() ) {
    return -1;
  }
  if( !tutorial04.CreateVertexBuffer() ) {
    return -1;
  }
  if( !tutorial04.CreateRenderingResources() ) {
    return -1;
  }

  // Rendering loop
  if( !window.RenderingLoop( tutorial04 ) ) {
    return -1;
  }

  return 0;
}
