
project ( lua C )
cmake_minimum_required ( VERSION 2.8 )

set (lua_version $ENV{LUA_VERSION})

if ("${lua_version}" STREQUAL "")
  set(lua_version 5.2.1)
endif()

include(ExternalProject)
ExternalProject_Add(
    lua-project
    URL http://www.lua.org/ftp/lua-${lua_version}.tar.gz
    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/lua-${lua_version}
    UPDATE_COMMAND ""
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy
      "${CMAKE_CURRENT_SOURCE_DIR}/lua.cmake" <SOURCE_DIR>/CMakeLists.txt
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/lua-${lua_version}
)

ExternalProject_Get_Property(lua-project install_dir)

install(DIRECTORY ${install_dir}/bin/ DESTINATION bin)
install(DIRECTORY ${install_dir}/lib/ DESTINATION lib)
install(DIRECTORY ${install_dir}/include/ DESTINATION include)