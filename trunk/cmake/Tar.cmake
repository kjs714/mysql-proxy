MACRO(TAR_UNPACK _file _wd)
	FIND_PROGRAM(GTAR_EXECUTABLE NAMES gtar tar)
	FIND_PROGRAM(GZIP_EXECUTABLE NAMES gzip)

	MESSAGE(STATUS "gtar: ${GTAR_EXECUTABLE}")
	MESSAGE(STATUS "gzip: ${GZIP_EXECUTABLE}")

	IF(GTAR_EXECUTABLE AND GZIP_EXECUTABLE)
		EXECUTE_PROCESS(COMMAND ${GZIP_EXECUTABLE} "-cd" ${_file} 
			COMMAND ${GTAR_EXECUTABLE} "xvf" "-"
			WORKING_DIRECTORY ${_wd})
	ELSE(GTAR_EXECUTABLE AND GZIP_EXECUTABLE)
		MESSAGE(STATUS "gnutar not found")
	ENDIF(GTAR_EXECUTABLE AND GZIP_EXECUTABLE)
ENDMACRO(TAR_UNPACK _file _wd)


MACRO(ZIP_UNPACK _file _wd)
	FIND_PROGRAM(7Z_EXECUTABLE NAMES 7z 7za)

	MESSAGE(STATUS "7zip: ${7Z_EXECUTABLE}")

	IF(7Z_EXECUTABLE)
		EXECUTE_PROCESS(COMMAND ${7Z_EXECUTABLE} x "-o${_wd}" "${_file}")
	ELSE(7Z_EXECUTABLE)
		MESSAGE(STATUS "7zip not found")
	ENDIF(7Z_EXECUTABLE)
ENDMACRO(ZIP_UNPACK _file _wd)


