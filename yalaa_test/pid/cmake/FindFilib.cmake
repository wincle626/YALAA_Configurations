# - Try to find the filib includes and library
# which defines
#
# FILIB_FOUND - system has FILIB
# FILIB_INCLUDE_DIR - where to find udt.h
# FILIB_LIBRARIES - the libraries to link against to use FILIB

set( FILIB_LIB_FOUND FALSE )
set( FILIB_INC_FOUND FALSE )

find_path( FILIB_INCLUDE_DIR NAMES filibdir.hpp HINTS "${CMAKE_PREFIX_PATH}/filibsrc/install/include" )

find_path( FILIB_LIBRARY_DIR NAMES libprim.so HINTS "${CMAKE_PREFIX_PATH}/filibsrc/install/lib" )

find_library( FILIB_LIBRARY NAMES prim HINTS "${CMAKE_PREFIX_PATH}/filibsrc/install/lib" )

set( FILIB_INCLUDE_DIRS ${FILIB_INCLUDE_DIR} )
set( FILIB_LIBRARY_DIRS ${FILIB_LIBRARY_DIR} )
set( FILIB_LIBRARYS ${FILIB_LIBRARY} )

if( FILIB_LIBRARY )
    set( FILIB_LIB_FOUND TRUE )
endif( FILIB_LIBRARY )

if( FILIB_LIB_FOUND )
    message( STATUS "Found FILIB libraries. " ${FILIB_LIBRARY} )
else( FILIB_LIB_FOUND )
    if( FILIB_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find FILIB library" )
    endif( FILIB_FIND_REQUIRED )
endif( FILIB_LIB_FOUND )

if( FILIB_INCLUDE_DIR )
    set( FILIB_INC_FOUND TRUE )
endif( FILIB_INCLUDE_DIR )

if( FILIB_INCLUDE_DIR )
    message( STATUS "Found FILIB headers. " ${FILIB_INCLUDE_DIR} )
else( FILIB_INCLUDE_DIR )
    if( FILIB_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find FILIB headers" )
    endif( FILIB_FIND_REQUIRED )
endif( FILIB_INCLUDE_DIR )

MARK_AS_ADVANCED(
    FILIB_INCLUDE_DIRS
    FILIB_LIBRARIES_DIRS
    FILIB_LIBRARIES
)
