# - Try to find the cxsc includes and library
# which defines
#
# CXSC_FOUND - system has CXSC
# CXSC_INCLUDE_DIR - where to find udt.h
# CXSC_LIBRARIES - the libraries to link against to use CXSC

set( CXSC_LIB_FOUND FALSE )
set( CXSC_INC_FOUND FALSE )

find_path( CXSC_INCLUDE_DIR NAMES cxsc_blas.hpp HINTS "${CMAKE_PREFIX_PATH}/cxsc-2-5-4/install/include" )

find_path( CXSC_LIBRARY_DIR NAMES libcxsc.so HINTS "${CMAKE_PREFIX_PATH}/cxsc-2-5-4/install/lib" )

find_library( CXSC_LIBRARY NAMES cxsc HINTS "${CMAKE_PREFIX_PATH}/cxsc-2-5-4/install/lib" )

set( CXSC_INCLUDE_DIRS ${CXSC_INCLUDE_DIR} )
set( CXSC_LIBRARY_DIRS ${CXSC_LIBRARY_DIR} )
set( CXSC_LIBRARYS ${CXSC_LIBRARY} )

if( CXSC_LIBRARY )
    set( CXSC_LIB_FOUND TRUE )
endif( CXSC_LIBRARY )

if( CXSC_LIB_FOUND )
    message( STATUS "Found CXSC libraries. " ${CXSC_LIBRARY} )
else( CXSC_LIB_FOUND )
    if( CXSC_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find CXSC library" )
    endif( CXSC_FIND_REQUIRED )
endif( CXSC_LIB_FOUND )

if( CXSC_INCLUDE_DIR )
    set( CXSC_INC_FOUND TRUE )
endif( CXSC_INCLUDE_DIR )

if( CXSC_INCLUDE_DIR )
    message( STATUS "Found CXSC headers. " ${CXSC_INCLUDE_DIR} )
else( CXSC_INCLUDE_DIR )
    if( CXSC_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find CXSC headers" )
    endif( CXSC_FIND_REQUIRED )
endif( CXSC_INCLUDE_DIR )

MARK_AS_ADVANCED(
    CXSC_INCLUDE_DIRS
    CXSC_LIBRARIES_DIRS
    CXSC_LIBRARIES
)
