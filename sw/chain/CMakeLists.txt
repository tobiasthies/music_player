# Tobias Thies
# Cmake Library

cmake_minimum_required(VERSION 3.10)

#set(CMAKE_CXX_COMPILER "/usr/bin/g++-9")
#set(CMAKE_LINK_EX "/usr/bin/g++-9")

project(music_player_chain)

set(MAIN_TARGET_NAME ${PROJECT_NAME})

include(support_music_library.cmake)
include(chain_default)

#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../bin)

add_executable(${MAIN_TARGET_NAME} ${${PROJECT_NAME}_SOURCE_DIR}/src/music_player_chain.cpp)

set_binary_names_chain_music(${MAIN_TARGET_NAME} ${MAIN_TARGET_NAME})
target_link_libraries (${MAIN_TARGET_NAME} music_library_static)

# Target for the library testing/example program
#add_executable(${MAIN_TARGET_NAME} ${${PROJECT_NAME}_SOURCE_DIR}/src/music_player_chain.cpp)
#set_binary_names_chain_music(ext ${MAIN_TARGET_NAME}_ext)

# Set library file names and output directory paths
#set_target_properties(${MAIN_TARGET_NAME}_lib PROPERTIES RELEASE_OUTPUT_NAME "creonic_dvb_s2x_demod")
#set_target_properties(${MAIN_TARGET_NAME}_lib PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${${PROJECT_NAME}_SOURCE_DIR}/lib)
#set_target_properties(${MAIN_TARGET_NAME}_lib PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${${PROJECT_NAME}_SOURCE_DIR}/lib)
#set_target_properties(${MAIN_TARGET_NAME}_lib PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${${PROJECT_NAME}_SOURCE_DIR}/lib)

# Set the names of the binary files and the output directory conform to the cse standard.
#set_binary_names_chain_cse(${MAIN_TARGET_NAME}_test hello_world)
#set_binary_names_chain_cse(${MAIN_TARGET_NAME}_example library_example)

# Link the library target to the cse library and the testing target to library.
#target_link_libraries(${MAIN_TARGET_NAME}_lib cse_static)
#target_link_libraries(${MAIN_TARGET_NAME}_test ${MAIN_TARGET_NAME}_lib cse_static)
#target_link_libraries(${MAIN_TARGET_NAME}_example ${MAIN_TARGET_NAME}_lib)
