# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

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

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/build

# Include any dependencies generated for this target.
include CMakeFiles/database.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/database.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/database.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/database.dir/flags.make

CMakeFiles/database.dir/codegen:
.PHONY : CMakeFiles/database.dir/codegen

CMakeFiles/database.dir/main.c.o: CMakeFiles/database.dir/flags.make
CMakeFiles/database.dir/main.c.o: /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/main.c
CMakeFiles/database.dir/main.c.o: CMakeFiles/database.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/database.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/database.dir/main.c.o -MF CMakeFiles/database.dir/main.c.o.d -o CMakeFiles/database.dir/main.c.o -c /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/main.c

CMakeFiles/database.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/database.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/main.c > CMakeFiles/database.dir/main.c.i

CMakeFiles/database.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/database.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/main.c -o CMakeFiles/database.dir/main.c.s

CMakeFiles/database.dir/funzioni.c.o: CMakeFiles/database.dir/flags.make
CMakeFiles/database.dir/funzioni.c.o: /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/funzioni.c
CMakeFiles/database.dir/funzioni.c.o: CMakeFiles/database.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/database.dir/funzioni.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/database.dir/funzioni.c.o -MF CMakeFiles/database.dir/funzioni.c.o.d -o CMakeFiles/database.dir/funzioni.c.o -c /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/funzioni.c

CMakeFiles/database.dir/funzioni.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/database.dir/funzioni.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/funzioni.c > CMakeFiles/database.dir/funzioni.c.i

CMakeFiles/database.dir/funzioni.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/database.dir/funzioni.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/funzioni.c -o CMakeFiles/database.dir/funzioni.c.s

# Object files for target database
database_OBJECTS = \
"CMakeFiles/database.dir/main.c.o" \
"CMakeFiles/database.dir/funzioni.c.o"

# External object files for target database
database_EXTERNAL_OBJECTS =

database: CMakeFiles/database.dir/main.c.o
database: CMakeFiles/database.dir/funzioni.c.o
database: CMakeFiles/database.dir/build.make
database: CMakeFiles/database.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable database"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/database.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/database.dir/build: database
.PHONY : CMakeFiles/database.dir/build

CMakeFiles/database.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/database.dir/cmake_clean.cmake
.PHONY : CMakeFiles/database.dir/clean

CMakeFiles/database.dir/depend:
	cd /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/build /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/build /Users/jeff/Desktop/uni/basi/Database-Unipd-2025/c/build/CMakeFiles/database.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/database.dir/depend

