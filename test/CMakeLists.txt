CMake_minimum_required(VERSION 3.6)
project(db_test)
set(CMAKE_CXX_STANDARD 17)
set(DB_APP "../lib/libdb.a")
find_library(PQXX_LIB pqxx)
find_library(PQ_LIB pq)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")
file(GLOB_RECURSE TEST_SOURCES true src/*.cpp src/*.h*)
set(FULL_SOURCES ${TEST_SOURCES} ${DB_APP} ../src/database_app.cpp ../src/database_connection.cpp)
add_executable(${PROJECT_NAME} ${FULL_SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE
   "../include"
)
add_subdirectory(googletest)
target_link_libraries(${PROJECT_NAME} PUBLIC gtest gmock ${PQXX_LIB} ${PQ_LIB})
