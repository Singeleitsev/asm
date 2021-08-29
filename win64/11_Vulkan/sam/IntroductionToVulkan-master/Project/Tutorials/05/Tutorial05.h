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

#if !defined(TUTORIAL_05_HEADER)
#define TUTORIAL_05_HEADER

#include "VulkanCommon.h"
#include "Tools.h"

namespace ApiWithoutSecrets {

  // ************************************************************ //
  // VertexData                                                   //
  //                                                              //
  // Struct describing data type and format of vertex attributes  //
  // ************************************************************ //
  struct VertexData {
    float   x, y, z, w;
    float   r, g, b, a;
  };

  // ************************************************************ //
  // RenderingResourcesData                                       //
  //                                                              //
  // Struct containing data used during rendering process         //
  // ************************************************************ //
  struct RenderingResourcesData {
    VkFramebuffer                         Framebuffer;
    VkCommandBuffer                       CommandBuffer;
    VkSemaphore                           ImageAvailableSemaphore;
    VkSemaphore                           FinishedRenderingSemaphore;
    VkFence                               Fence;

    RenderingResourcesData() :
      Framebuffer( VK_NULL_HANDLE ),
      CommandBuffer( VK_NULL_HANDLE ),
      ImageAvailableSemaphore( VK_NULL_HANDLE ),
      FinishedRenderingSemaphore( VK_NULL_HANDLE ),
      Fence( VK_NULL_HANDLE ) {
    }
  };

  // ************************************************************ //
  // VulkanTutorial04Parameters                                   //
  //                                                              //
  // Vulkan specific parameters                                   //
  // ************************************************************ //
  struct VulkanTutorial05Parameters {
    VkRenderPass                          RenderPass;
    VkPipeline                            GraphicsPipeline;
    BufferParameters                      VertexBuffer;
    BufferParameters                      StagingBuffer;
    VkCommandPool                         CommandPool;
    std::vector<RenderingResourcesData>   RenderingResources;

    static const size_t                   ResourcesCount = 3;

    VulkanTutorial05Parameters() :
      RenderPass( VK_NULL_HANDLE ),
      GraphicsPipeline( VK_NULL_HANDLE ),
      VertexBuffer(),
      StagingBuffer(),
      CommandPool( VK_NULL_HANDLE ),
      RenderingResources( ResourcesCount ) {
    }
  };

  // ************************************************************ //
  // Tutorial04                                                   //
  //                                                              //
  // Class for presenting Vulkan usage topics                     //
  // ************************************************************ //
  class Tutorial05 : public VulkanCommon {
  public:
    Tutorial05();
    ~Tutorial05();

    bool    CreateRenderingResources();
    bool    CreateRenderPass();
    bool    CreatePipeline();
    bool    CreateVertexBuffer();
    bool    CreateStagingBuffer();
    bool    CopyVertexData();

    bool    Draw() override;

  private:
    VulkanTutorial05Parameters  Vulkan;

    bool                                                              CreateCommandPool( uint32_t queue_family_index, VkCommandPool *pool );
    bool                                                              AllocateCommandBuffers( VkCommandPool pool, uint32_t count, VkCommandBuffer *command_buffers );
    bool                                                              CreateSemaphore( VkSemaphore *semaphore );
    bool                                                              CreateFence( VkFenceCreateFlags flags, VkFence *fence );
    Tools::AutoDeleter<VkShaderModule, PFN_vkDestroyShaderModule>     CreateShaderModule( const char* filename );
    Tools::AutoDeleter<VkPipelineLayout, PFN_vkDestroyPipelineLayout> CreatePipelineLayout();
    bool                                                              CreateBuffer( VkBufferUsageFlags usage, VkMemoryPropertyFlagBits memoryProperty, BufferParameters &buffer );
    bool                                                              AllocateBufferMemory( VkBuffer buffer, VkMemoryPropertyFlagBits property, VkDeviceMemory *memory );
    const std::vector<float>&                                         GetVertexData() const;
    bool                                                              PrepareFrame( VkCommandBuffer command_buffer, const ImageParameters &image_parameters, VkFramebuffer &framebuffer );
    bool                                                              CreateFramebuffer( VkFramebuffer &framebuffer, VkImageView image_view );
    void                                                              DestroyBuffer( BufferParameters& buffer );

    void                                                              ChildClear() override;
    bool                                                              ChildOnWindowSizeChanged() override;
  };

} // namespace ApiWithoutSecrets

#endif // TUTORIAL_05_HEADER