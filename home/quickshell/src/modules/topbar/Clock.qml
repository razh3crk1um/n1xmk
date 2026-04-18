// Clock.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../../common"
import "../../style"

TopbarItem {
    id: clockRoot

    screen: root.screen
    hlColor: Theme.colorBlue

    property bool fullFormatVisible: false

    tooltipText: fullFormatVisible ? Qt.formatDateTime(sysClock.date, "hh:mm") : Qt.formatDateTime(sysClock.date, "ddd yyyy-MM-d")

    contentItem: RowLayout {
        spacing: 0

        Text {
            text: fullFormatVisible ? " " : " "
            font {
                family: Theme.fontSolid
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }

        Text {
            text: fullFormatVisible ? Qt.formatDateTime(sysClock.date, "ddd yyyy-MM-d") : Qt.formatDateTime(sysClock.date, "hh:mm")
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
    }

    SystemClock {
        id: sysClock
        precision: SystemClock.Minutes
    }

    onClicked: mouse => {
        fullFormatVisible = !fullFormatVisible;
    }
}
