#include "canvas2d.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main( int argc, char* argv[] )
{
    QCoreApplication::setAttribute( Qt::AA_EnableHighDpiScaling );
    QGuiApplication app( argc, argv );

    Canvas2d::declareQml();

    QQmlApplicationEngine engine;
    engine.addImportPath( QML_CANVAS_ROOT "res/qml/" );
    engine.load( QUrl( QStringLiteral( "qrc:/main.qml" ) ));

    if ( engine.rootObjects().isEmpty() ) {
        return -1;
    }

    return app.exec();
}
