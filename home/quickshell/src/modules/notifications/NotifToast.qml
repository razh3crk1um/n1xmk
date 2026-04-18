// NotifToast.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications

import "../../providers"
import "../../style"

Rectangle {
    id: notifToastRoot

    property bool requestKeepOn: false
    readonly property int defaultExpireTimeout: 6000
    readonly property int toastWidth: 300
    readonly property int verticalPadding: 20
    readonly property color urgencyColor: {
        switch (currentNotification.urgency) {
        case NotificationUrgency.Critical:
            return Theme.colorYellow;
        case NotificationUrgency.Normal:
            return Theme.colorRed;
        case NotificationUrgency.Low:
            return Theme.colorBlue;
        default:
            return Theme.colorRed;
        }
    }

    width: toastWidth
    implicitHeight: mainLayout.implicitHeight + verticalPadding
    radius: 12
    color: Theme.colorBlack
    border.color: urgencyColor
    border.width: 2

    Rectangle {
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        width: 0
        radius: 0
        color: urgencyColor
    }

    MouseArea {
        id: globalMouseArea
        anchors.fill: parent

        hoverEnabled: true
        propagateComposedEvents: true

        onEntered: {
            dismissTimer.stop();
        }
        onExited: {
            if (currentNotification && currentNotification.expireTimeout !== 0) {
                dismissTimer.start();
            }
        }

        acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton
        onClicked: function (mouse) {
            if (mouse.button === Qt.LeftButton) {
                requestKeepOn = true;
            } else if (mouse.button === Qt.MiddleButton) {
                NotifService.dismissAll();
            } else if (mouse.button === Qt.RightButton) {
                NotifService.centerOpen = !NotifService.centerOpen;
            }
        }
    }

    ColumnLayout {
        id: mainLayout
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 14
            leftMargin: 18
        }
        spacing: 6

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            IconImage {
                visible: currentNotification.appIcon !== ""
                source: currentNotification.appIcon
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
            }

            Text {
                text: currentNotification.appName
                color: Theme.colorWhite
                font {
                    pixelSize: Theme.fontSizeSm
                    bold: true
                }
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Text {
                text: ""
                color: Theme.colorWhite
                font {
                    pixelSize: Theme.fontSizeSm
                    bold: true
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: NotifService.centerOpen = !NotifService.centerOpen
                }
            }
        }

        Image {
            visible: currentNotification.image !== ""
            source: currentNotification.image
            Layout.preferredWidth: 48
            Layout.preferredHeight: 48
            fillMode: Image.PreserveAspectFit
        }

        Text {
            text: currentNotification.summary
            color: urgencyColor
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            visible: currentNotification.summary !== ""
        }

        Text {
            text: currentNotification.body
            color: Theme.colorBrightWhite
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            wrapMode: Text.WordWrap
            textFormat: Text.StyledText
            Layout.fillWidth: true
            visible: currentNotification.body !== ""
        }

        Flow {
            Layout.fillWidth: true
            spacing: 6
            visible: currentNotification.actions.length > 0

            Repeater {
                model: currentNotification.actions
                delegate: Rectangle {
                    required property var modelData
                    implicitWidth: actionLabel.implicitWidth + 20
                    implicitHeight: 26
                    radius: 4
                    color: actionArea.containsMouse ? Theme.colorButtonHover : Theme.colorButton
                    border.color: Theme.colorBrightBlack
                    border.width: 1

                    Text {
                        id: actionLabel
                        anchors.centerIn: parent
                        text: modelData.text
                        color: Theme.colorBrightWhite
                        font.pixelSize: Theme.fontSizeSm
                    }
                    MouseArea {
                        id: actionArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            modelData.invoke();
                        }
                    }
                }
            }
        }

        Item {
            implicitHeight: 4
        }
    }

    Timer {
        id: dismissTimer
        interval: {
            if (!currentNotification || currentNotification.expireTimeout === -1)
                return defaultExpireTimeout;
            return currentNotification.expireTimeout * 1000;
        }
        running: currentNotification && currentNotification.expireTimeout !== 0
        onTriggered: currentNotification.dismiss()
    }
}
