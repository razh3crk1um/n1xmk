// Separator.qml
import QtQuick
import QtQuick.Layouts
import Quickshell

import "../style"

TopbarItem {
    id: separatorRoot

    screen: root.screen
    hovered: false
    indicatorVisible: false
    interactive: false
    inverted: false
    horizontalPadding: 0

    contentItem: RowLayout {
        spacing: 0

        Text {
            text: ""
            font {
                family: Theme.fontSolid
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
    }
}
