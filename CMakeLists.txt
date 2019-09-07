cmake_minimum_required(VERSION 3.1.0)

project(cyusb)

find_package(Qt5 COMPONENTS Network Widgets REQUIRED)

add_library(cyusb src/libcyusb.cpp)

include_directories(src)

add_executable(cyusb-bin
  src/gui/controlcenter.cpp
  src/gui/controlcenter.ui
  src/gui/fx2_download.cpp
  src/gui/fx3_download.cpp
  src/gui/main.cpp
  src/gui/streamer.cpp
)

set_target_properties(cyusb-bin PROPERTIES AUTOMOC ON AUTOUIC ON)

# TODO(nicholasbishop): fix the errors that require this flag
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")

target_link_libraries(cyusb-bin Qt5::Network Qt5::Widgets cyusb usb-1.0 pthread)

set_target_properties(cyusb-bin PROPERTIES OUTPUT_NAME cyusb)

add_executable(cyusb-fwload utilities/00_fwload.cpp)
target_link_libraries(cyusb-fwload cyusb usb-1.0)

add_executable(cyusb-download-fx3 utilities/download_fx3.cpp)
target_link_libraries(cyusb-download-fx3 cyusb usb-1.0)
