cmake_minimum_required( VERSION 3.5 )

project( sysrepo-crystal )

set( CMAKE_CXX_FLAGS " -Wall -O3 -std=c++11 " )

# include_directories( ${CMAKE_STAGING_PREFIX}/usr/include )
# link_directories( ${CMAKE_STAGING_PREFIX}/usr/lib )

set ( sysrepo-crystal_files
      sysrepo-crystal.c
)

add_library( ${PROJECT_NAME} STATIC ${sysrepo-crystal_files} )

target_link_libraries( ${PROJECT_NAME} sysrepo.a )
target_link_libraries( ${PROJECT_NAME} yang )