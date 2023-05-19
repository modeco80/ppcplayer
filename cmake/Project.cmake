# Copyright (C) 2023 PowerPC Player Authors.
# SPDX-License-Identifier: MIT

macro(_ppcplayer_target_gcclike target)
	set(_CORE_COMPILE_ARGS -Wall -Wextra)
	if(CMAKE_BUILD_TYPE STREQUAL "Release")
		set(_CORE_COMPILE_ARGS ${_CORE_COMPILE_ARGS} -Werror)
	endif()
endmacro()

function(ppcplayer_target target)
	target_compile_definitions(${target} PRIVATE 
		"$<$<CONFIG:DEBUG>:PPCPLAYER_DEBUG>"
		# We want binaries to run on XP, so force Windows headers to give us
		# APIs for up to XP. We can dynamically resolve any newer APIs we may
		# optionally want after the fact, if they are really needed.
	 	_WIN32_WINNT=0x0501
	)
	target_compile_features(${target} PUBLIC cxx_std_20)

	if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
		_ppcplayer_target_gcclike(${target})
	elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
		message(FATAL_ERROR "Building on MSVC... Fuck that")
	else()
		message(FATAL_ERROR "I do not know how to setup ${CMAKE_CXX_COMPILER_ID}")
	endif()

	# default compile options to the core compile flags set by the macro implementation
	target_compile_options(${target} PRIVATE ${_CORE_COMPILE_ARGS})

	# add git version dependency
	add_dependencies(${target} _git_version)
endfunction()
