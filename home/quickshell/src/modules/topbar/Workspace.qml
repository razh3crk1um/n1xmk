// Workspace.qml
import QtQuick
import QtQuick.Layouts
import Quickshell

import "../../providers"
import "../../common"
import "../../style"

Rectangle {
    id: workspaceRoot

    implicitWidth: contentArea.implicitWidth
    Layout.fillHeight: true
    color: Theme.colorBlack

    Rectangle {
        id: indicator
        height: 2
        width: parent.width
        color: Theme.colorRed
        anchors.bottom: parent.bottom
    }

    RowLayout {
        id: contentArea
        spacing: 0
        anchors {
            top: parent.top
            bottom: indicator.top
            horizontalCenter: parent.horizontalCenter
        }

        Repeater {
            model: NiriService.workspaces

            Rectangle {
                width: 32
                height: root.height - indicator.height
                readonly property bool hovered: mouseArea.containsMouse
                readonly property bool hasWindows: model.activeWindowId !== null && model.activeWindowId !== undefined && model.activeWindowId !== 0

                color: model.isFocused ? Theme.colorWorkspaceFocused : hovered || isUrgent ? Theme.colorRed : Theme.colorBlack
                // border.color: model.isUrgent ? Theme.colorRed : "#16181A"
                // border.width: 2
                // radius: 4

                Text {
                    anchors.centerIn: parent
                    text: NiriService.workspaceIcon(model)
                    font.family: Theme.fontSolid
                    color: model.isFocused ? Theme.colorBrightCyan : hovered || isUrgent ? Theme.colorBlack : hasWindows ? Theme.colorRed : Theme.colorBrightBlack
                    font.pixelSize: Theme.fontSize
                }

                MouseArea {
                    id: mouseArea
                    hoverEnabled: true
                    anchors.fill: parent
                    onClicked: {
                        NiriService.focusWorkspaceById(model.id);
                    }
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
}
