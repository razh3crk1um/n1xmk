// Memory.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../../common"
import "../../style"

TopbarItem {
    id: memoryRoot

    screen: root.screen
    hlColor: Theme.colorYellow

    property bool swapVisible: false
    property string memPercent: "0"
    property string swapUsage: "0"

    tooltipText: swapVisible ? memPercent + "%[mem]" : swapUsage + "G[swap]"

    contentItem: RowLayout {
        spacing: 0

        Text {
            text: " "
            font {
                family: Theme.fontSolid
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }

        Text {
            text: swapVisible ? swapUsage + "G[swap]" : memPercent + "%"
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
    }

    Process {
        id: memProcess
        command: ["free", "-m"]

        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                const lines = data.split('\n');
                for (const line of lines) {
                    const parts = line.trim().split(/\s+/);
                    if (line.includes("Mem:")) {
                        const total = parseInt(parts[1]) || 1;
                        const used = parseInt(parts[2]) || 0;
                        memPercent = Math.round(100 * used / total);
                    } else if (line.includes("Swap:")) {
                        const used = parseInt(parts[2]) || 0;
                        swapUsage = (used / 1024).toFixed(1);
                    }
                }
            }
        }
        running: false
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            memProcess.running = false;
            memProcess.running = true;
        }
    }

    onClicked: {
        swapVisible = !swapVisible;
    }
}
