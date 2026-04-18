// TopbarItem.qml
import QtQuick
import QtQuick.Layouts
import Quickshell

import "../style"

Rectangle {
    id: root

    implicitWidth: (contentLoader.item?.implicitWidth ?? 0) + horizontalPadding
    Layout.fillHeight: true
    color: bg

    property var screen
    property alias contentItem: contentLoader.sourceComponent
    property string tooltipText: ""

    property int alignment: Qt.AlignHCenter
    property int horizontalPadding: Theme.horizontalPadding

    property bool hovered: mouseArea.containsMouse || false
    property bool indicatorVisible: true
    property bool interactive: true
    property bool inverted: true
    property color hlColor: Theme.colorBrightBlack

    readonly property bool highlighted: inverted && hovered
    readonly property color fg: highlighted ? Theme.colorBlack : hlColor
    readonly property color bg: highlighted ? hlColor : Theme.colorBlack

    signal clicked
    signal middleClicked
    signal rightClicked
    signal scrolled(var wheel)

    Rectangle {
        id: topIndicator
        width: parent.width
        height: indicatorVisible ? 2 : 0
        anchors.top: parent.top
        color: hlColor
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: root.interactive ? Qt.PointingHandCursor : Qt.ArrowCursor
        acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton
        onClicked: mouse => {
            if (mouse.button === Qt.LeftButton) {
                root.clicked();
            } else if (mouse.button === Qt.MiddleButton) {
                root.middleClicked();
            } else if (mouse.button === Qt.RightButton) {
                root.rightClicked();
            }
        }
        onWheel: wheel => {
            root.scrolled(wheel);
        }
    }

    Loader {
        id: contentLoader
        anchors {
            top: topIndicator.bottom
            bottom: parent.bottom
            left: alignment === Qt.AlignLeft ? parent.left : undefined
            right: alignment === Qt.AlignRight ? parent.right : undefined

            horizontalCenter: alignment === Qt.AlignHCenter ? parent.horizontalCenter : undefined
            leftMargin: alignment === Qt.AlignLeft ? Theme.horizontalPadding : 0
            rightMargin: alignment === Qt.AlignRight ? Theme.horizontalPadding : 0
        }
    }

    ToolTip {
        targetModule: root
        sourceScreen: root.screen
        text: tooltipText
    }
}
