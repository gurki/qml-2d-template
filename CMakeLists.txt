cmake_minimum_required( VERSION 3.14 FATAL_ERROR )

project(
    qml-canvas
    VERSION 0.0.0
    DESCRIPTION "A minimal 2D-graphics starting point with QML"
    HOMEPAGE_URL "https://github.com/gurki/"
    LANGUAGES CXX
)

add_subdirectory( dependencies )
find_package( Qt5 COMPONENTS Core Qml Quick REQUIRED )

set( CMAKE_AUTOMOC ON )
set( CMAKE_AUTORCC ON )
set( CMAKE_AUTOUIC ON )


add_compile_definitions( QML_CANVAS_ROOT="${CMAKE_CURRENT_SOURCE_DIR}/" )

add_library( ${PROJECT_NAME} STATIC
    src/model.cpp
)

add_library( ${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME} )

target_compile_features( ${PROJECT_NAME}
    PUBLIC
        cxx_std_17  #  std::optional, nested namespaces
    PRIVATE
        cxx_auto_type
        cxx_defaulted_functions
        cxx_lambdas
        cxx_range_for
        cxx_trailing_return_types
        cxx_unicode_literals
        cxx_inline_namespaces
        cxx_generic_lambdas
)

target_include_directories( ${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

target_link_libraries( ${PROJECT_NAME}
    PUBLIC
        glm::glm
        Qt5::Core
        Qt5::Qml
        Qt5::Quick
)

set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR} )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR} )
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR} )

install(
    DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/res
    DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
)

qt5_add_resources( QML_RESOURCES ${CMAKE_CURRENT_LIST_DIR}/res/qml/qml.qrc )

add_executable( ${PROJECT_NAME}-demo
    demo/main.cpp
    demo/canvas2d.cpp
    ${QML_RESOURCES}
)

target_include_directories( ${PROJECT_NAME}
    PUBLIC
        demo/
)

target_link_libraries( ${PROJECT_NAME}-demo
    PRIVATE
        ${PROJECT_NAME}::${PROJECT_NAME}
)