cmake_minimum_required(VERSION 3.2)

project(TanLabs-Speed-Tester-Backend)

if(HOST_TEST)
	set(CMAKE_C_COMPILER  gcc)
	set(CMAKE_CXX_COMPILER g++)
else()
	set(CMAKE_C_COMPILER  aarch64-linux-gnu-gcc)
	set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)
endif()

include_directories("include")

file(GLOB_RECURSE SRCS
	src/*.cc
)

add_executable(tanlabs-speed-tester-backend ${SRCS})
