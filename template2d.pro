QT += quick
CONFIG += c++1z
DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    $$PWD/examples/main.cpp \
    $$PWD/examples/canvas2d.cpp

HEADERS += \
    $$PWD/examples/canvas2d.h

RESOURCES += \
    $$PWD/res/qml/qml.qrc

include( $$PWD/kmeans.pri )
