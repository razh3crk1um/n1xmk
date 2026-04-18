// ToolTip.qml
import QtQuick
import Quickshell
import Quickshell.Wayland

import "../style"

Window {
    id: tooltipRoot

    visible: targetModule && targetModule.hovered !== undefined ? targetModule.hovered : false
    screen: sourceScreen
    color: "transparent"

    readonly property int horizontalPadding: 60
    readonly property int verticalPadding: 20
    width: label.implicitWidth + horizontalPadding
    height: label.implicitHeight + verticalPadding
    flags: Qt.ToolTip | Qt.FramelessWindowHint | Qt.WindowTransparentForInput | Qt.WindowStaysOnTopHint

    property var targetModule: parent
    property alias text: label.text
    property var sourceScreen

    function updatePosition() {
        if (!screen || !targetModule)
            return;
        var globalPoint = targetModule.mapToGlobal(targetModule.width / 2, 0);
        x = globalPoint.x - (width / 2);
        y = (targetModule.Window.window ? targetModule.Window.window.height : Theme.topbarHeight) + 5;
    }

    onVisibleChanged: if (visible)
        updatePosition()
    Connections {
        target: targetModule
        enabled: tooltipRoot.visible
        function onWidthChanged() {
            if (tooltipRoot.visible) {
                tooltipRoot.updatePosition();
            }
        }

        // function onXChanged() {
        //     if (tooltipRoot.visible) {
        //         tooltipRoot.updatePosition();
        //     }
        // }
    }

    Rectangle {
        anchors.fill: parent
        color: Theme.colorBlack
        radius: 8
        border.color: Theme.colorRed
        border.width: 2
        opacity: 0.9

        Text {
            id: label
            anchors.centerIn: parent
            color: Theme.colorBrightWhite
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
        }
    }
}
