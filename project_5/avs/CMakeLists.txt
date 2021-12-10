cmake_minimum_required(VERSION 3.21)
project(avs)

set(CMAKE_CXX_STANDARD 20)

add_executable(avs main.cpp dispatcher.cpp dispatcher.h cryptographer.cpp cryptographer.h)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(avs PRIVATE Threads::Threads)