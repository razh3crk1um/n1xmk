// Network.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../../common"
import "../../style"

TopbarItem {
    id: networkRoot

    screen: root.screen
    hlColor: Theme.colorGreen

    property real downBytes: 0
    property real upBytes: 0
    property var lastRx: 0
    property var lastTx: 0
    property string activeInterface: ""
    property string ipInfo: ""
    property string routeInfo: ""
    property int timeCounter: 0
    property int displayMode: 0
    readonly property bool offlineStatus: activeInterface === "" || ipInfo === ""

    tooltipText: ipInfo + "\n" + routeInfo

    contentItem: RowLayout {
        id: contentArea
        spacing: 0

        readonly property var currentModel: {
            if (offlineStatus)
                return [
                    {
                        icon: "󰲛 ",
                        val: "disconnected"
                    }
                ];
            if (displayMode === 0)
                return [
                    {
                        icon: " ",
                        val: format(downBytes) + "/s"
                    },
                    {
                        icon: "  ",
                        val: format(upBytes) + "/s"
                    }
                ];
            if (displayMode === 1)
                return [
                    {
                        icon: "󰈀 ",
                        val: ipInfo
                    }
                ];
            return [
                {
                    icon: "󱂇 ",
                    val: routeInfo
                }
            ];
        }

        Repeater {
            model: contentArea.currentModel
            RowLayout {
                spacing: 0
                Text {
                    text: modelData.icon
                    font {
                        family: Theme.fontSolid
                        pixelSize: Theme.fontSize
                    }
                    color: fg
                    Layout.alignment: Qt.AlignBaseline
                }
                Text {
                    text: modelData.val
                    font {
                        pixelSize: Theme.fontSize
                        bold: true
                    }
                    color: fg
                    Layout.alignment: Qt.AlignBaseline
                }
            }
        }
    }

    function format(bytes) {
        if (bytes < 1024)
            return bytes + " B";
        if (bytes < 1048576)
            return (bytes / 1024).toFixed(1) + " K";
        return (bytes / 1048576).toFixed(1) + " M";
    }

    Process {
        id: interfaceFinder
        command: ["sh", "-c", "IFACE=$(ip route | awk '/default/ && !/tun/ {print $5; exit}'); IP=$(ip -o -4 addr show dev $IFACE | awk '{print $4}'); GW=$(ip route show dev $IFACE | awk '/default/ {print $3}'); echo \"$IFACE|$IP|$GW\""]

        stdout: SplitParser {
            onRead: data => {
                if (!data || !data.includes("|"))
                    return;

                let parts = data.trim().split('|');
                activeInterface = parts[0];
                ipInfo = activeInterface ? `${activeInterface}: ${parts[1]}` : "Offline - No Ip";
                routeInfo = activeInterface ? `${activeInterface} via ${parts[2]}` : "No Interface Detected";
            }
        }
    }

    Process {
        id: netProc
        command: activeInterface ? ["grep", activeInterface, "/proc/net/dev"] : []
        stdout: SplitParser {
            onRead: data => {
                if (!data || data.trim() === "")
                    return;

                var parts = data.trim().split(/[:\s]+/);
                if (parts.length < 10)
                    return;

                var rx = parseInt(parts[1]);
                var tx = parseInt(parts[9]);

                if (lastRx > 0) {
                    if (rx >= lastRx) {
                        downBytes = rx - lastRx;
                        upBytes = tx - lastTx;
                    }
                }

                lastRx = rx;
                lastTx = tx;
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        property int timeCounter: 0
        onTriggered: {
            if (activeInterface) {
                netProc.running = false;
                netProc.running = true;
            }

            if (parent.timeCounter % 10 === 0) {
                interfaceFinder.running = false;
                interfaceFinder.running = true;
            }
            timeCounter = (timeCounter + 1) % 60;
        }
    }
    onClicked: {
        displayMode = (displayMode + 1) % 3;
    }
    onRightClicked: {
        displayMode = 0;
    }
}
