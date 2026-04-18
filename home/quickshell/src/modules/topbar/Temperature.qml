// Temperature.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../../common"
import "../../style"

TopbarItem {
    id: temperatureRoot

    screen: root.screen
    hlColor: Theme.colorBrightRed
    interactive: false
    inverted: false

    property int tempUsage: 0

    tooltipText: "thermal_zone0: " + tempUsage + "°C"

    contentItem: RowLayout {
        spacing: 0
        Text {
            text: " "
            font {
                family: Theme.fontSolid
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }

        Text {
            text: tempUsage + "°C"
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
    }

    Process {
        id: temperatureProcess
        command: ["sh", "-c", "cat /sys/class/thermal/thermal_zone0/temp"]

        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var raw = parseInt(data.trim());
                tempUsage = (raw / 1000).toFixed(1);
            }
        }
        running: true
    }

    Timer {
        interval: 10000
        running: true
        repeat: true

        onTriggered: {
            temperatureProcess.running = false;
            temperatureProcess.running = true;
        }
    }
}
