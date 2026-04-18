// Notifications.qml
import QtQuick
import Quickshell
import Quickshell.Wayland

import "./providers"
import "./style"
import "./modules/notifications"

Item {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            anchors {
                top: true
                right: true
            }
            implicitWidth: 320
            implicitHeight: toastColumn.implicitHeight + 20
            color: "transparent"

            Column {
                id: toastColumn
                anchors {
                    top: parent.top
                    right: parent.right
                    margins: 10
                }
                spacing: 8
                Repeater {
                    model: NotifService.activeToasts
                    delegate: NotifToast {
                        id: notifToastRoot

                        opacity: 0
                        x: 50

                        property bool pinned: notifToastRoot.requestKeepOn
                        RetainableLock {
                            id: retainableLock
                            object: currentNotification
                            locked: pinned
                        }
                        states: [
                            State {
                                name: "active"
                                when: currentNotification !== null && !retainableLock.locked
                                PropertyChanges {
                                    target: notifToastRoot
                                    opacity: 0.95
                                    x: 0
                                }
                            },
                            State {
                                name: "closed"
                                when: retainableLock.locked
                                PropertyChanges {
                                    target: notifToastRoot
                                    opacity: 0.0
                                    x: 50
                                }
                            }
                        ]

                        transitions: [
                            Transition {
                                from: "*"
                                to: "active"
                                ParallelAnimation {
                                    NumberAnimation {
                                        properties: "opacity,x"
                                        duration: 300
                                        easing.type: Easing.OutCubic
                                    }
                                }
                            },
                            Transition {
                                from: "active"
                                to: "closed"
                                SequentialAnimation {
                                    NumberAnimation {
                                        properties: "opacity,x"
                                        duration: 500
                                        easing.type: Easing.InQuad
                                    }
                                    ScriptAction {
                                        script: {
                                            pinned = false;
                                            NotifService.removeToast(currentNotification);
                                        }
                                    }
                                }
                            }
                        ]

                        Connections {
                            target: currentNotification
                            function onClosed(reason) {
                                pinned = true;
                            }
                        }
                    }
                }
            }
        }
    }

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: notifCenterEntry

            required property var modelData
            screen: modelData
            visible: NotifService.centerOpen || contentRect.opacity > 0
            WlrLayershell.layer: WlrLayer.Overlay
            // WlrLayershell.keyboardFocus: NotifService.centerOpen ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None
            WlrLayershell.margins {
                top: 10
                right: 10
            }
            anchors {
                top: true
                right: true
            }
            implicitWidth: 400
            implicitHeight: (notifCenterEntry.screen && notifCenterEntry.screen.height) ? notifCenterEntry.screen.height * 0.95 : 800
            color: "transparent"

            NotifCenter {
                id: contentRect

                opacity: 0
                transform: Translate {
                    id: contentTrans
                    x: 50
                }

                states: [
                    State {
                        name: "active"
                        when: NotifService.centerOpen
                        PropertyChanges {
                            target: contentRect
                            opacity: 1
                        }
                        PropertyChanges {
                            target: contentTrans
                            x: 0
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: ""
                        to: "active"
                        NumberAnimation {
                            properties: "opacity,x"
                            duration: 300
                            easing.type: Easing.OutCubic
                        }
                    },
                    Transition {
                        from: "active"
                        to: ""
                        NumberAnimation {
                            properties: "opacity,x"
                            duration: 250
                            easing.type: Easing.InQuad
                        }
                    }
                ]
            }
        }
    }
}
