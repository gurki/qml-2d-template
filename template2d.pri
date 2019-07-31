INCLUDEPATH += \
    $$PWD/include

SOURCES += \
    $$PWD/src/model.cpp

HEADERS += \
    $$PWD/include/library/model.h


# dependencies

INCLUDEPATH += $$PWD/dependencies/glm/
DEPENDPATH += $$PWD/dependencies/glm/
DEFINES += GLM_ENABLE_EXPERIMENTAL
