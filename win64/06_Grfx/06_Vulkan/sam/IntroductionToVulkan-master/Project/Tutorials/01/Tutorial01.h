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

#if !defined(TUTORIAL_01_HEADER)
#define TUTORIAL_01_HEADER

#include "vulkan.h"
#include "OperatingSystem.h"

namespace ApiWithoutSecrets {

  // ************************************************************ //
  // VulkanTutorial01Parameters                                   //
  //                                                              //
  // Vulkan specific parameters                                   //
  // ************************************************************ //
  struct VulkanTutorial01Parameters {
    VkInstance  Instance;
    VkDevice    Device;
    uint32_t    QueueFamilyIndex;
    VkQueue     Queue;

    VulkanTutorial01Parameters() :
      Instance( VK_NULL_HANDLE ),
      Device( VK_NULL_HANDLE ),
      QueueFamilyIndex( 0 ),
      Queue( VK_NULL_HANDLE ) {
    }
  };

  // ************************************************************ //
  // Tutorial01                                                   //
  //                                                              //
  // Class for presenting Vulkan usage topics                     //
  // ************************************************************ //
  class Tutorial01 : public OS::ProjectBase {
  public:
    Tutorial01();
    ~Tutorial01();

    bool OnWindowSizeChanged() override;
    bool Draw() override;

    bool PrepareVulkan();

  private:
    OS::LibraryHandle           VulkanLibrary;
    VulkanTutorial01Parameters  Vulkan;

    bool LoadVulkanLibrary();
    bool LoadExportedEntryPoints();
    bool LoadGlobalLevelEntryPoints();
    bool CreateInstance();
    bool LoadInstanceLevelEntryPoints();
    bool CreateDevice();
    bool CheckPhysicalDeviceProperties( VkPhysicalDevice physical_device, uint32_t &queue_family_index );
    bool LoadDeviceLevelEntryPoints();
    bool GetDeviceQueue();
  };

} // namespace ApiWithoutSecrets

#endif // TUTORIAL_01_HEADER