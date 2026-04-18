// NotifCenter.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Services.Notifications

import "../../providers"
import "../../style"

Rectangle {
    anchors.fill: parent
    color: Theme.colorBlack
    radius: 8
    border.color: Theme.colorRed
    border.width: 2
    clip: true

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.MiddleButton | Qt.RightButton
        onClicked: function (mouse) {
            if (mouse.button === Qt.MiddleButton || mouse.button === Qt.RightButton) {
                NotifService.centerOpen = !NotifService.centerOpen;
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 8

        IpcHandler {
            target: "notif"

            function toggleNotifCenter() {
                NotifService.centerOpen = !NotifService.centerOpen;
                return "ok";
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Text {
                text: "通知中心"
                color: Theme.colorRed
                font {
                    pixelSize: Theme.fontSize + 2
                    bold: true
                }
            }
            Item {
                Layout.fillWidth: true
            }
            Rectangle {
                implicitWidth: 60
                implicitHeight: 24
                radius: 4
                color: clearArea.containsMouse ? Theme.colorButtonHover : Theme.colorButton
                Text {
                    anchors.centerIn: parent
                    text: "清空"
                    color: Theme.colorWhite
                    font {
                        pixelSize: Theme.fontSizeSm
                        bold: true
                    }
                }
                MouseArea {
                    id: clearArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: NotifService.clearHistory()
                }
            }
            Rectangle {
                implicitWidth: 24
                implicitHeight: 24
                radius: 4
                color: closeArea.containsMouse ? Theme.colorButtonHover : Theme.colorButton
                Text {
                    anchors.centerIn: parent
                    text: ""
                    color: Theme.colorWhite
                    font {
                        pixelSize: Theme.fontSize
                        bold: true
                    }
                }
                MouseArea {
                    id: closeArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: NotifService.centerOpen = false
                }
            }
        }

        ListView {
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: NotifService.history
            spacing: 8
            clip: true

            delegate: Rectangle {
                required property var modelData
                required property int index
                width: ListView.view.width
                implicitHeight: histLayout.implicitHeight + 16
                radius: 6
                color: Theme.colorPanel
                border.color: Theme.colorBrightBlack

                ColumnLayout {
                    id: histLayout
                    anchors {
                        fill: parent
                        margins: 10
                    }
                    spacing: 4

                    RowLayout {
                        Text {
                            text: modelData.appName
                            color: Theme.colorWhite
                            font {
                                pixelSize: Theme.fontSizeSm
                                bold: true
                            }
                            Layout.fillWidth: true
                        }
                        Text {
                            text: modelData.timestamp
                            color: Theme.colorWhite
                            font {
                                pixelSize: Theme.fontSizeSm
                                bold: true
                            }
                            Layout.fillWidth: true
                        }

                        Text {
                            text: "✕"
                            color: Theme.colorWhite
                            font {
                                pixelSize: Theme.fontSizeSm
                                bold: true
                            }
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    if (modelData.tracked)
                                        modelData.dismiss();
                                    NotifService.history.remove(index);
                                }
                            }
                        }
                    }
                    Text {
                        text: modelData.summary
                        color: Theme.colorRed
                        font {
                            pixelSize: Theme.fontSize
                            bold: true
                        }
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        visible: modelData.summary !== ""
                    }
                    Text {
                        text: modelData.body
                        color: Theme.colorBrightWhite
                        font {
                            pixelSize: Theme.fontSizeSm
                            bold: true
                        }
                        wrapMode: Text.WordWrap
                        textFormat: Text.StyledText
                        Layout.fillWidth: true
                        visible: modelData.body !== ""
                    }
                    Item {
                        implicitHeight: 4
                    }
                }
            }

            Text {
                anchors.centerIn: parent
                text: "空空如也"
                color: Theme.colorWhite
                font {
                    pixelSize: Theme.fontSize
                    bold: true
                }
                visible: parent.count === 0
            }
        }
    }
}
