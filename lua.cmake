
project ( lua_build )
cmake_minimum_required ( VERSION 2.8 )

set( SRC_CORE src/lapi.c src/lcode.c src/lctype.c src/ldebug.c src/ldo.c src/ldump.c 
  src/lfunc.c src/lgc.c src/llex.c src/lmem.c src/lobject.c src/lopcodes.c src/lparser.c 
  src/lstate.c src/lstring.c src/ltable.c src/ltm.c src/lundump.c src/lvm.c src/lzio.c
  src/loadlib.c )
set( SRC_LIB src/lauxlib.c src/lbaselib.c src/lbitlib.c src/lcorolib.c src/ldblib.c 
  src/liolib.c src/lmathlib.c src/loslib.c src/lstrlib.c src/ltablib.c src/linit.c )
set( SRC_LUA src/lua.c )

#add_definitions(-DLUA_ANSI=1)
add_library (liblua STATIC ${SRC_CORE} ${SRC_LIB})
set_target_properties(liblua PROPERTIES OUTPUT_NAME lua)

include_directories ( src ${CMAKE_CURRENT_BINARY_DIR} )
add_executable(lua ${SRC_LUA})
target_link_libraries(lua liblua m)

install(TARGETS lua DESTINATION bin)
install(TARGETS liblua DESTINATION lib)
install(FILES src/lua.h src/lualib.h src/lauxlib.h src/luaconf.h DESTINATION include)