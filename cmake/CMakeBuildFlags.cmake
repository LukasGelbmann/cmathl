include(CheckCXXCompilerFlag)

if("${CMAKE_C_COMPILER}" MATCHES "clang$" OR "${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
	SET(CMAKE_COMPILER_IS_CLANG 1)
endif()

if("${CMAKE_C_COMPILER}" MATCHES "gcc$" OR "${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
	SET(CMAKE_COMPILER_IS_GNUC 1)
endif()

if(CMAKE_COMPILER_IS_GNUC OR CMAKE_COMPILER_IS_CLANG)
	FIND_LIBRARY(LIBM m)

	SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c11 -Wall -Ofast")
endif()

if(CMAKE_COMPILER_IS_GNUC)
	if(CMAKE_C_COMPILER_VERSION VERSION_GREATER "5.3.0" AND NOT APPLE)
		SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c11 -Wall -Ofast")
	endif()
endif()
