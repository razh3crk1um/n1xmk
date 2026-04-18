// Inhibitor.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../../common"
import "../../style"

TopbarItem {
    id: inhibitorRoot
    screen: root.screen
    hlColor: inhibited ? Theme.colorBrightCyan : Theme.colorBlue
    indicatorVisible: false
    inverted: false

    property bool inhibited: false

    tooltipText: inhibited ? "Idle Inhibition: Active" : "Idle Inhibition: Inactive"

    Process {
        id: inhibitProcess
        command: ["systemd-inhibit", "--who=Quickshell Inhibitor", "--why=Idle inhibitor mode", "--what=idle", "sleep", "infinity"]

        onExited: {
            if (inhibited)
                running = true;
        }
    }
    function toggleInhibit() {
        inhibited = !inhibited;
        if (inhibited) {
            inhibitProcess.running = true;
        } else {
            inhibitProcess.running = false;
        }
    }

    contentItem: RowLayout {
        spacing: 0

        Text {
            text: " "
            font {
                family: Theme.fontNerd
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
    }

    onClicked: {
        toggleInhibit();
    }
}
