set(SOURCES
    main.cpp
)

qt5_add_resources(RESOURCES 2048.qrc)

add_executable(hawaii-2048 ${SOURCES} ${RESOURCES})
qt5_use_modules(hawaii-2048 Quick)

install(TARGETS hawaii-2048 DESTINATION ${CMAKE_INSTALL_BINDIR})
