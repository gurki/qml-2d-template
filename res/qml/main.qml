import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import teqi 1.0


Window {
    visible: true
    width: 640
    height: 480
    title: "just another project"
    color: "#333"

    Canvas2d {
        id: canvas
        anchors.fill: parent
    }
}
