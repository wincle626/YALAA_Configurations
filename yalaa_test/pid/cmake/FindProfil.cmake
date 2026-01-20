# - Try to find the profil includes and library
# which defines
#
# PROFIL_FOUND - system has PROFIL
# PROFIL_INCLUDE_DIR - where to find udt.h
# PROFIL_LIBRARIES - the libraries to link against to use PROFIL

set( PROFIL_LIB_FOUND FALSE )
set( PROFIL_INC_FOUND FALSE )

find_path( PROFIL_INCLUDE_DIR NAMES profildir.h HINTS "${CMAKE_PREFIX_PATH}/Profil-2.0.8/include" )

find_path( PROFIL_LIBRARY_DIR NAMES libProfil.so HINTS "${CMAKE_PREFIX_PATH}/Profil-2.0.8/lib" )

find_library( PROFIL_LIBRARY NAMES Profil HINTS "${CMAKE_PREFIX_PATH}/Profil-2.0.8/lib" )
find_library( PROFILBIAS_LIBRARY NAMES Bias HINTS "${CMAKE_PREFIX_PATH}/Profil-2.0.8/lib" )
find_library( PROFILPACKAGES_LIBRARY NAMES ProfilPackages HINTS "${CMAKE_PREFIX_PATH}/Profil-2.0.8/lib" )

set( PROFIL_INCLUDE_DIRS ${PROFIL_INCLUDE_DIR} )
set( PROFIL_LIBRARY_DIRS ${PROFIL_LIBRARY_DIR} )
set( PROFIL_LIBRARYS ${PROFIL_LIBRARY} )

if( PROFIL_LIBRARY )
    set( PROFIL_LIB_FOUND TRUE )
endif( PROFIL_LIBRARY )

if( PROFIL_LIB_FOUND )
    message( STATUS "Found PROFIL libraries. " ${PROFIL_LIBRARY} )
else( PROFIL_LIB_FOUND )
    if( PROFIL_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find PROFIL library" )
    endif( PROFIL_FIND_REQUIRED )
endif( PROFIL_LIB_FOUND )

if( PROFIL_INCLUDE_DIR )
    set( PROFIL_INC_FOUND TRUE )
endif( PROFIL_INCLUDE_DIR )

if( PROFIL_INCLUDE_DIR )
    message( STATUS "Found PROFIL headers. " ${PROFIL_INCLUDE_DIR} )
else( PROFIL_INCLUDE_DIR )
    if( PROFIL_FIND_REQUIRED )
        message( FATAL_ERROR "Could'not find PROFIL headers" )
    endif( PROFIL_FIND_REQUIRED )
endif( PROFIL_INCLUDE_DIR )

MARK_AS_ADVANCED(
    PROFIL_INCLUDE_DIRS
    PROFIL_LIBRARIES_DIRS
    PROFIL_LIBRARIES
    PROFILBIAS_LIBRARY
    PROFILPACKAGES_LIBRARY
)
