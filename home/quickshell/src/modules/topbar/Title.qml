// Title.qml
import QtQuick
import QtQuick.Layouts
import Quickshell

import "../../providers"
import "../../common"
import "../../style"

TopbarItem {
    id: titleRoot

    Layout.fillWidth: true
    screen: root.screen
    hlColor: Theme.colorBrightCyan
    indicatorVisible: false
    interactive: false
    inverted: false
    alignment: Qt.AlignLeft

    readonly property int absoluteMaxWidth: 500
    readonly property string contentLabel: NiriService.focusedWindow?.title ?? "NixOS - n1xmk"

    tooltipText: contentLabel

    contentItem: RowLayout {
        width: titleRoot.width
        spacing: 0

        Text {
            text: "  "
            font {
                family: Theme.fontSolid
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }

        Text {
            text: contentLabel
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
            Layout.fillWidth: true
            Layout.maximumWidth: absoluteMaxWidth
            Layout.rightMargin: Theme.cornerWidth + 5
            elide: Text.ElideRight
        }
    }
}
