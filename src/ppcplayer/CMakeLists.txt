# Copyright (C) 2023 PowerPC Player Authors.
# SPDX-License-Identifier: MIT

add_executable(ppcplayer
		main.cpp
		)

ppcplayer_target(ppcplayer)
set_target_properties(ppcplayer PROPERTIES
		RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}
		)

target_include_directories(ppcplayer PRIVATE ${PROJECT_BINARY_DIR})
target_link_libraries(ppcplayer PRIVATE ppcplayer::player)