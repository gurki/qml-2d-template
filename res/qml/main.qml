import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import templates 1.0


Window {
    visible: true
    width: 640
    height: 480
    title: "qml 2d-template"
    color: "#333"

    Canvas2d {
        id: canvas
        anchors.fill: parent
    }
}
