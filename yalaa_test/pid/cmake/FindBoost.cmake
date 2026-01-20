# - Try to find the filib includes and library
# which defines
#
# BOOST_FOUND - system has BOOST
# BOOST_INCLUDE_DIR - where to find udt.h
# BOOST_LIBRARIES - the libraries to link against to use BOOST

set( BOOST_LIB_FOUND FALSE )
set( BOOST_INC_FOUND FALSE )

find_path( BOOST_INCLUDE_DIR NAMES boostcpp.jam HINTS "${CMAKE_PREFIX_PATH}/boost_1_81_0/" )

find_path( BOOST_LIBRARY_DIR NAMES libboost_math_c99.so HINTS "${CMAKE_PREFIX_PATH}/boost_1_81_0/stage/lib" )

find_library( BOOST_LIBRARY NAMES boost_math_c99 HINTS "${CMAKE_PREFIX_PATH}/boost_1_81_0/stage/lib" )

set( BOOST_INCLUDE_DIRS ${BOOST_INCLUDE_DIR} )
set( BOOST_LIBRARY_DIRS ${BOOST_LIBRARY_DIR} )
set( BOOST_LIBRARYS ${BOOST_LIBRARY} )

if( BOOST_LIBRARY )
    set( BOOST_LIB_FOUND TRUE )
endif( BOOST_LIBRARY )

if( BOOST_LIB_FOUND )
    message( STATUS "Found BOOST libraries. " ${BOOST_LIBRARY} )
else( BOOST_LIB_FOUND )
    if( BOOST_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find BOOST library" )
    endif( BOOST_FIND_REQUIRED )
endif( BOOST_LIB_FOUND )

if( BOOST_INCLUDE_DIR )
    set( BOOST_INC_FOUND TRUE )
endif( BOOST_INCLUDE_DIR )

if( BOOST_INCLUDE_DIR )
    message( STATUS "Found BOOST headers. " ${BOOST_INCLUDE_DIR} )
else( BOOST_INCLUDE_DIR )
    if( BOOST_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find BOOST headers" )
    endif( BOOST_FIND_REQUIRED )
endif( BOOST_INCLUDE_DIR )

MARK_AS_ADVANCED(
    BOOST_INCLUDE_DIRS
    BOOST_LIBRARIES_DIRS
    BOOST_LIBRARIES
)
