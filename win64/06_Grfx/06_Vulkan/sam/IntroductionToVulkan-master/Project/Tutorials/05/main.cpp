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

#include "Tutorial05.h"

int main( int argc, char **argv ) {
  ApiWithoutSecrets::OS::Window window;
  ApiWithoutSecrets::Tutorial05 tutorial05;

  // Window creation
  if( !window.Create( "05 - Staging Resources" ) ) {
    return -1;
  }

  // Vulkan preparations and initialization
  if( !tutorial05.PrepareVulkan( window.GetParameters() ) ) {
    return -1;
  }

  // Tutorial 05
  if( !tutorial05.CreateRenderingResources() ) {
    return -1;
  }
  if( !tutorial05.CreateRenderPass() ) {
    return -1;
  }
  if( !tutorial05.CreatePipeline() ) {
    return -1;
  }
  if( !tutorial05.CreateVertexBuffer() ) {
    return -1;
  }
  if( !tutorial05.CreateStagingBuffer() ) {
    return -1;
  }
  if( !tutorial05.CopyVertexData() ) {
    return -1;
  }

  // Rendering loop
  if( !window.RenderingLoop( tutorial05 ) ) {
    return -1;
  }

  return 0;
}
