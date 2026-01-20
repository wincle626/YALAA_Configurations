
#------------------------cmake optoin----------------------------
cmake_minimum_required(VERSION 3.8)
set( CMAKE_BUILD_TYPE release )
set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" )
if ( CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND
    CMAKE_CXX_COMPILER_VERSION VERSION_LESS 4.8 )
    message( FATAL_ERROR "GCC 4.8 or later is required." )
endif ()
cmake_policy( SET CMP0015 NEW )
cmake_policy( SET CMP0022 NEW )
cmake_policy( SET CMP0037 NEW )
cmake_policy( SET CMP0048 NEW )

#-----------------------project option--------------------------
set( PROJECT_NAME "a_MultipleEqualPoles_SISO" )
set( PROJECT_DESCRIPTION "a PID test with Yalaa library" )
set( PROJECT_VERSION 0.1.0 )
set( PROJECT_LANGUAGE CXX )
project( a_MultipleEqualPoles_SISO
    DESCRIPTION ${PROJECT_DESCRIPTION}
    VERSION ${PROJECT_VERSION}
    LANGUAGES ${PROJECT_LANGUAGE}
)
message( "${PROJECT_DESCRIPTION} of version ${PROJECT_VERSION} using ${PROJECT_LANGUAGE}" )

#----------------------pre-requiiste-----------------------------
find_package( Cxsc REQUIRED )
message( "CXSC header directory: ${CXSC_INCLUDE_DIRS}" )
message( "CXSC library directory: ${CXSC_LIBRARY_DIRS}" )
message( "CXSC library: ${CXSC_LIBRARYS}" )
find_package( Profil REQUIRED )
message( "PROFIL header directory: ${PROFIL_INCLUDE_DIRS}" )
message( "PROFIL library directory: ${PROFIL_LIBRARY_DIRS}" )
message( "PROFIL library: ${PROFIL_LIBRARYS}" )
message( "PROFILBIAS library: ${PROFILBIAS_LIBRARY}" )
message( "PROFILPACKAGES library: ${PROFILPACKAGES_LIBRARY}" )
find_package( Filib REQUIRED )
message( "FILIB header directory: ${FILIB_INCLUDE_DIRS}" )
message( "FILIB library directory: ${FILIB_LIBRARY_DIRS}" )
message( "FILIB library: ${FILIB_LIBRARYS}" )
find_package( Yalaa REQUIRED )
message( "YALAA header directory: ${YALAA_INCLUDE_DIRS}" )
message( "YALAA library directory: ${YALAA_LIBRARY_DIRS}" )
message( "YALAA library: ${YALAA_LIBRARYS}" )
find_package( Boost REQUIRED )
message( "BOOST header directory: ${BOOST_INCLUDE_DIRS}" )
message( "BOOST library directory: ${BOOST_LIBRARY_DIRS}" )
message( "BOOST library: ${BOOST_LIBRARYS}" )

#-------------------------source--------------------------------
set( PID_SRC
	${CMAKE_CURRENT_SOURCE_DIR}/a_MultipleEqualPoles_SISO.cpp
)
set( PID_INC
	${CMAKE_CURRENT_SOURCE_DIR}/a_MultipleEqualPoles_SISO.hpp
	${CMAKE_CURRENT_SOURCE_DIR}/PID.hpp
)
add_executable( PID_TEST ${PID_SRC} ${PID_INC}) 
#install(TARGETS PID_TEST
#        CONFIGURATIONS Debug
#        RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/Debug/bin)
install(TARGETS PID_TEST
        CONFIGURATIONS Release
        RUNTIME DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/Release/bin)
if( USE_CXSC )   
	target_include_directories( PID_TEST SYSTEM
		PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
		PUBLIC ${BOOST_INCLUDE_DIRS}
		PUBLIC ${CXSC_INCLUDE_DIRS}
		PUBLIC ${YALAA_INCLUDE_DIRS}
	)
	target_link_libraries( PID_TEST
		PUBLIC ${CXSC_LIBRARYS}
		PUBLIC ${BOOST_LIBRARYS}
		PUBLIC ${YALAA_LIBRARYS}
	)
endif( USE_CXSC )
if( USE_PROFIL )   
	target_include_directories( PID_TEST SYSTEM
		PUBLIC "./"
		PUBLIC ${BOOST_INCLUDE_DIRS}
		PUBLIC ${PROFIL_INCLUDE_DIRS}
		PUBLIC ${YALAA_INCLUDE_DIRS}
	)
	target_link_libraries( PID_TEST
		PUBLIC ${BOOST_LIBRARYS}
		PUBLIC ${PROFIL_LIBRARYS}
		PUBLIC ${PROFILBIAS_LIBRARY}
		PUBLIC ${PROFILPACKAGE_LIBRARY}
		PUBLIC ${YALAA_LIBRARYS}
	)
endif( USE_PROFIL )
if( USE_FILIB )   
	target_include_directories( PID_TEST SYSTEM
		PUBLIC ${BOOST_INCLUDE_DIRS}
		PUBLIC ${FILIB_INCLUDE_DIRS}
		PUBLIC ${YALAA_INCLUDE_DIRS}
	)
	target_link_libraries( PID_TEST
		PUBLIC ${FILIB_LIBRARYS}
		PUBLIC ${BOOST_LIBRARYS}
		PUBLIC ${YALAA_LIBRARYS}
	)
endif( USE_FILIB )

