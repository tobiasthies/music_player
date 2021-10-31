# Read the user definied variable for the Music library path if set, otherwise try to find it otherwise set a default value.
if(NOT DEFINED LIB_MUSIC_PATH)

	# Try to find the correct Music path, start three levels up from the main source tree.
	set(LIB_MUSIC_PATH_PART1 "${${PROJECT_NAME}_SOURCE_DIR}/../../..")
	
	# File system level counter (temporary variable)
	set(CNT_ 3)
	
	# Go until 8 levels up to find the Music path.
	while(CNT_ LESS 8)
	
		# Create path to check for the Music library.
		set(LIB_MUSIC_PATH "${LIB_MUSIC_PATH_PART1}/music_library")
	
		# If the current path exists, exit the search loop and write the path found.
		if(EXISTS ${LIB_MUSIC_PATH})
			break()
		else() # Set default absolute path. This path is used if no other can be found!
	        set(LIB_MUSIC_PATH "~thies/proj/music_library")
   
		endif()
		
		# Go one addition level up in the file tree.
		set(LIB_MUSIC_PATH_PART1 "${LIB_MUSIC_PATH_PART1}/..")
		
		# Increase the counter by one
		MATH( EXPR CNT_ "${CNT_} + 1" )
	endwhile() 
	
	# Remove used temporary variables
	unset(CNT_)
	unset(LIB_MUSIC_PATH_PART1)
endif()

# Convert the given path to a CMake path (e.g., replace the ~ sign with the home directory path in POSIX OS).
file(TO_CMAKE_PATH ${LIB_MUSIC_PATH} LIB_MUSIC_PATH)

# Convert the given path to an absolute path if a relative path was given.
if(NOT IS_ABSOLUTE ${LIB_MUSIC_PATH})
	set(LIB_MUSIC_PATH "${${PROJECT_NAME}_SOURCE_DIR}/${LIB_MUSIC_PATH}")
endif()

# Remove additional relative parts in the absolute path (e.g. /a/b/../c -> /a/c).
get_filename_component(LIB_MUSIC_PATH ${LIB_MUSIC_PATH} ABSOLUTE)

# Check existence of the MUSIC library path, if it does not exist abort the script.
if(NOT EXISTS ${LIB_MUSIC_PATH})
	message(FATAL_ERROR "Given path to the MUSIC library does not exist (\"${LIB_MUSIC_PATH}\")."
	"\nPossible solutions:"
	"\n1) Define a valid path with the \"-DLIB_MUSIC_PATH=<valid_music_path>\" option."
	"\n2) Make the given (default) path available.")
endif()

# Enhance the CMake files search path by the MUSIC CMake file location.
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${LIB_MUSIC_PATH}/CMake_includes")
