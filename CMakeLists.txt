cmake_minimum_required(VERSION 3.21)
project(TweenStudio VERSION 2.4.6 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Widgets Multimedia Svg)
qt_standard_project_setup()

qt_add_executable(TweenStudio WIN32
    src/main.cpp
    src/TweenStudio.rc
    resources.qrc
)
target_link_libraries(TweenStudio PRIVATE Qt6::Widgets Qt6::Multimedia Qt6::Svg)
target_compile_definitions(TweenStudio PRIVATE QT_NO_KEYWORDS)

set_target_properties(TweenStudio PROPERTIES
    WIN32_EXECUTABLE TRUE
    OUTPUT_NAME "TweenStudio"
)
