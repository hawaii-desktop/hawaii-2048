project(2048)

cmake_minimum_required(VERSION 2.8.9)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed
set(CMAKE_AUTOMOC ON)

# Set version
set(HAWAII_2048_VERSION_MAJOR 0)
set(HAWAII_2048_VERSION_MINOR 0)
set(HAWAII_2048_VERSION_PATCH 0)
set(HAWAII_2048_VERSION_STRING "${HAWAII_2048_VERSION_MAJOR}.${HAWAII_2048_VERSION_MINOR}.${HAWAII_2048_VERSION_PATCH}")

# Installation directories
include(GNUInstallDirs)

# Define additional paths
set(CMAKE_INSTALL_STYLESDIR "${CMAKE_INSTALL_DATADIR}/hawaii-2048/styles")
set(CMAKE_INSTALL_FULL_STYLESDIR "${CMAKE_INSTALL_FULL_DATADIR}/hawaii-2048/styles")

# Macro to print feature summary
include(FeatureSummary)

# Our CMake modules
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Add custom uninstall target
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
    IMMEDIATE @ONLY)
add_custom_target(uninstall "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")

# Set up packaging
set(CPACK_PACKAGE_NAME "hawaii-2048")
set(CPACK_PACKAGE_VERSION "${HAWAII_2048_VERSION_STRING}")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_SOURCE_IGNORE_FILES "/build/;/.git;/*.user;/.tx/;~$;${CPACK_SOURCE_IGNORE_FILES}")
include(CPack)
add_custom_target(dist COMMAND ${CMAKE_MAKE_PROGRAM} package_source)

# Macros for package config
include(CMakePackageConfigHelpers)

# Macro to generate export header for libraries
include(GenerateExportHeader)

# Build flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -std=c++0x")

# Assume release build by default
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "" FORCE)
endif()

# Find Qt5
find_package(Qt5 5.1 REQUIRED COMPONENTS Core Gui Qml Quick)

# Subdirectories
add_subdirectory(data)
add_subdirectory(src)

# Display featute summary
feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
