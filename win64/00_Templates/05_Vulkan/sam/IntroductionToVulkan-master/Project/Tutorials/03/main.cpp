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

#include "Tutorial03.h"

int main( int argc, char **argv ) {
  ApiWithoutSecrets::OS::Window window;
  ApiWithoutSecrets::Tutorial03 tutorial03;

  // Window creation
  if( !window.Create( "03 - First Triangle" ) ) {
    return -1;
  }

  // Vulkan preparations and initialization
  if( !tutorial03.PrepareVulkan( window.GetParameters() ) ) {
    return -1;
  }

  // Tutorial 03
  if( !tutorial03.CreateRenderPass() ) {
    return -1;
  }
  if( !tutorial03.CreateFramebuffers() ) {
    return -1;
  }
  if( !tutorial03.CreatePipeline() ) {
    return -1;
  }
  if( !tutorial03.CreateSemaphores() ) {
    return -1;
  }
  if( !tutorial03.CreateCommandBuffers() ) {
    return -1;
  }
  if( !tutorial03.RecordCommandBuffers() ) {
    return -1;
  }

  // Rendering loop
  if( !window.RenderingLoop( tutorial03 ) ) {
    return -1;
  }

  return 0;
}
