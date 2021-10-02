cmake_minimum_required(VERSION 3.20)
project(project)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_C_FLAGS "${CMAKE_CFLAGS} -fopenmp")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG")
add_executable(project main.cpp animal.cpp animal.h container.cpp container.h bird.cpp bird.h beast.cpp beast.h fish.cpp rnd.h fish.h)
