# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /data/c/database_app

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data/c/database_app

# Include any dependencies generated for this target.
include test/CMakeFiles/db_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/db_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/db_test.dir/flags.make

test/CMakeFiles/db_test.dir/src/main.cpp.o: test/CMakeFiles/db_test.dir/flags.make
test/CMakeFiles/db_test.dir/src/main.cpp.o: test/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/c/database_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/db_test.dir/src/main.cpp.o"
	cd /data/c/database_app/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/db_test.dir/src/main.cpp.o -c /data/c/database_app/test/src/main.cpp

test/CMakeFiles/db_test.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/db_test.dir/src/main.cpp.i"
	cd /data/c/database_app/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/c/database_app/test/src/main.cpp > CMakeFiles/db_test.dir/src/main.cpp.i

test/CMakeFiles/db_test.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/db_test.dir/src/main.cpp.s"
	cd /data/c/database_app/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/c/database_app/test/src/main.cpp -o CMakeFiles/db_test.dir/src/main.cpp.s

test/CMakeFiles/db_test.dir/__/src/database_app.cpp.o: test/CMakeFiles/db_test.dir/flags.make
test/CMakeFiles/db_test.dir/__/src/database_app.cpp.o: src/database_app.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/c/database_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object test/CMakeFiles/db_test.dir/__/src/database_app.cpp.o"
	cd /data/c/database_app/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/db_test.dir/__/src/database_app.cpp.o -c /data/c/database_app/src/database_app.cpp

test/CMakeFiles/db_test.dir/__/src/database_app.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/db_test.dir/__/src/database_app.cpp.i"
	cd /data/c/database_app/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/c/database_app/src/database_app.cpp > CMakeFiles/db_test.dir/__/src/database_app.cpp.i

test/CMakeFiles/db_test.dir/__/src/database_app.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/db_test.dir/__/src/database_app.cpp.s"
	cd /data/c/database_app/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/c/database_app/src/database_app.cpp -o CMakeFiles/db_test.dir/__/src/database_app.cpp.s

test/CMakeFiles/db_test.dir/__/src/database_connection.cpp.o: test/CMakeFiles/db_test.dir/flags.make
test/CMakeFiles/db_test.dir/__/src/database_connection.cpp.o: src/database_connection.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/c/database_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object test/CMakeFiles/db_test.dir/__/src/database_connection.cpp.o"
	cd /data/c/database_app/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/db_test.dir/__/src/database_connection.cpp.o -c /data/c/database_app/src/database_connection.cpp

test/CMakeFiles/db_test.dir/__/src/database_connection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/db_test.dir/__/src/database_connection.cpp.i"
	cd /data/c/database_app/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/c/database_app/src/database_connection.cpp > CMakeFiles/db_test.dir/__/src/database_connection.cpp.i

test/CMakeFiles/db_test.dir/__/src/database_connection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/db_test.dir/__/src/database_connection.cpp.s"
	cd /data/c/database_app/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/c/database_app/src/database_connection.cpp -o CMakeFiles/db_test.dir/__/src/database_connection.cpp.s

# Object files for target db_test
db_test_OBJECTS = \
"CMakeFiles/db_test.dir/src/main.cpp.o" \
"CMakeFiles/db_test.dir/__/src/database_app.cpp.o" \
"CMakeFiles/db_test.dir/__/src/database_connection.cpp.o"

# External object files for target db_test
db_test_EXTERNAL_OBJECTS =

test/db_test: test/CMakeFiles/db_test.dir/src/main.cpp.o
test/db_test: test/CMakeFiles/db_test.dir/__/src/database_app.cpp.o
test/db_test: test/CMakeFiles/db_test.dir/__/src/database_connection.cpp.o
test/db_test: test/CMakeFiles/db_test.dir/build.make
test/db_test: lib/libgtest.a
test/db_test: lib/libgmock.a
test/db_test: /usr/local/lib/libpqxx.a
test/db_test: /usr/lib/libpq.so
test/db_test: lib/libgtest.a
test/db_test: test/CMakeFiles/db_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data/c/database_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable db_test"
	cd /data/c/database_app/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/db_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/db_test.dir/build: test/db_test

.PHONY : test/CMakeFiles/db_test.dir/build

test/CMakeFiles/db_test.dir/clean:
	cd /data/c/database_app/test && $(CMAKE_COMMAND) -P CMakeFiles/db_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/db_test.dir/clean

test/CMakeFiles/db_test.dir/depend:
	cd /data/c/database_app && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data/c/database_app /data/c/database_app/test /data/c/database_app /data/c/database_app/test /data/c/database_app/test/CMakeFiles/db_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/db_test.dir/depend
