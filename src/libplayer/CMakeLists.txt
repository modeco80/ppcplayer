# Copyright (C) 2023 PowerPC Player Authors.
# SPDX-License-Identifier: MIT

add_library(player
	ppcemu/dummy.cpp
)

ppcplayer_target(player)
target_include_directories(player PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(player PRIVATE ${PROJECT_BINARY_DIR})

target_link_libraries(player PUBLIC
	unicorn
)

add_library(ppcplayer::player ALIAS player)