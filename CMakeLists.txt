# Copyright (C) 2023 PowerPC Player Authors.
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.25)

if(" ${CMAKE_SOURCE_DIR}" STREQUAL " ${CMAKE_BINARY_DIR}")
	message(FATAL_ERROR "In-source-tree builds are strictly prohibited. Please don't do them.")
endif()

project(ppcplayer
	LANGUAGES CXX
	DESCRIPTION "PowerPC Player"
	VERSION 0.1
	)

# Set the default C++ standard for (bad) projects
# which do not test for feature support.
set(CMAKE_CXX_STANDARD 20)
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(Policies)
include(Project)
include(BuildDeps)

# we aren't a replacement for wine
if(NOT CMAKE_SYSTEM_NAME STREQUAL "Windows")
        message(FATAL_ERROR "PowerPC Player is not intended to be built targeting non-Windows platforms.")
endif()

# Add a target for Git version generation.
set(VERSION_FILENAME GitVersion.hpp)
add_custom_target(_git_version
	COMMAND $<TARGET_FILE:Python3::Interpreter> ${PROJECT_SOURCE_DIR}/tools/build/gitversion.py ${VERSION_FILENAME}
	WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
	SOURCES ${PROJECT_BINARY_DIR}/${VERSION_FILENAME})
set_source_files_properties(${PROJECT_BINARY_DIR}/${VERSION_FILENAME} PROPERTIES GENERATED TRUE)

add_subdirectory(src/libplayer)
add_subdirectory(src/ppcplayer)