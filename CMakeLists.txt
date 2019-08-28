cmake_minimum_required(VERSION 3.1.0)

project(cyusb)

find_package(Qt5 COMPONENTS Network Widgets REQUIRED)

include_directories(gui_src)

add_library(cyusb lib/libcyusb.cpp)

add_executable(cyusb-bin
  gui_src/controlcenter.cpp
  gui_src/controlcenter.ui
  gui_src/fx2_download.cpp
  gui_src/fx3_download.cpp
  gui_src/main.cpp
  gui_src/streamer.cpp
)

set_target_properties(cyusb-bin PROPERTIES AUTOMOC ON AUTOUIC ON)

# TODO(nicholasbishop): fix the errors that require this flag
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")

target_link_libraries(cyusb-bin Qt5::Network Qt5::Widgets cyusb usb-1.0 pthread)

set_target_properties(cyusb-bin PROPERTIES OUTPUT_NAME cyusb)
