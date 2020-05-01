cmake_minimum_required(VERSION 3.6)
# What we are building:
# db (Static Library) and app (Executable)
project(db)
set(APP_EXECUTABLE app)

# C++ standard
set(CMAKE_CXX_STANDARD 17)

# System dependencies
set(PQXX /usr/local/include/pqxx)
find_library(PQXX_LIB pqxx)
find_library(PQ_LIB pq)
find_package(Threads REQUIRED)

# Custom build flags
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -pthread")

# Sources
# Static Library
set(SOURCE ./src/database_app.cpp ./src/database_connection.cpp)
# Executable
set(EXESOURCE ./src/main.cpp ./src/database_app.cpp ./src/database_connection.cpp)

# Define binary outputs
add_executable(${APP_EXECUTABLE} ${EXESOURCE})
add_library(${PROJECT_NAME} STATIC ${SOURCE})

# Configure output locations of binaries
set_target_properties(${PROJECT_NAME}
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)
set_target_properties(${APP_EXECUTABLE}
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)

# Header and Linker paths
# Static Library
target_include_directories(${PROJECT_NAME} PRIVATE
   "."
   "include"
)
target_link_libraries(${PROJECT_NAME} PUBLIC ${PQXX_LIB} ${PQ_LIB} Threads::Threads)
# Executable
target_include_directories(${APP_EXECUTABLE} PRIVATE
    "."
    "include"
)
target_link_libraries(${APP_EXECUTABLE} PUBLIC ${PQXX_LIB} ${PQ_LIB} ${PSTCH} Threads::Threads)

# Tell CMake to build our tests in the "test" directory
add_subdirectory(test)
