# - Try to find the filib includes and library
# which defines
#
# YALAA_FOUND - system has YALAA
# YALAA_INCLUDE_DIR - where to find udt.h
# YALAA_LIBRARIES - the libraries to link against to use YALAA

set( YALAA_LIB_FOUND FALSE )
set( YALAA_INC_FOUND FALSE )

find_path( YALAA_INCLUDE_DIR NAMES yalaa.hpp HINTS "${CMAKE_PREFIX_PATH}/yalaa-0.92/install/include" )

find_path( YALAA_LIBRARY_DIR NAMES libyalaa.so HINTS "${CMAKE_PREFIX_PATH}/yalaa-0.92/install/lib" )

find_library( YALAA_LIBRARY NAMES yalaa HINTS "${CMAKE_PREFIX_PATH}/yalaa-0.92/install/lib" )

set( YALAA_INCLUDE_DIRS ${YALAA_INCLUDE_DIR} )
set( YALAA_LIBRARY_DIRS ${YALAA_LIBRARY_DIR} )
set( YALAA_LIBRARYS ${YALAA_LIBRARY} )

if( YALAA_LIBRARY )
    set( YALAA_LIB_FOUND TRUE )
endif( YALAA_LIBRARY )

if( YALAA_LIB_FOUND )
    message( STATUS "Found YALAA libraries. " ${YALAA_LIBRARY} )
else( YALAA_LIB_FOUND )
    if( YALAA_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find YALAA library" )
    endif( YALAA_FIND_REQUIRED )
endif( YALAA_LIB_FOUND )

if( YALAA_INCLUDE_DIR )
    set( YALAA_INC_FOUND TRUE )
endif( YALAA_INCLUDE_DIR )

if( YALAA_INCLUDE_DIR )
    message( STATUS "Found YALAA headers. " ${YALAA_INCLUDE_DIR} )
else( YALAA_INCLUDE_DIR )
    if( YALAA_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find YALAA headers" )
    endif( YALAA_FIND_REQUIRED )
endif( YALAA_INCLUDE_DIR )

MARK_AS_ADVANCED(
    YALAA_INCLUDE_DIRS
    YALAA_LIBRARIES_DIRS
    YALAA_LIBRARIES
)
