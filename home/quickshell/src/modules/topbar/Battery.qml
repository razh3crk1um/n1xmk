// Battery.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower

import "../../common"
import "../../style"

TopbarItem {
    id: batteryRoot

    screen: root.screen
    hlColor: Theme.colorCyan

    readonly property var batteryInfo: UPower.displayDevice
    property bool remaningTimeVisible: false

    readonly property int iconIndex: Math.floor(Math.min(batteryInfo.percentage, 0.99) * 5)
    readonly property string iconText: {
        if (batteryInfo.state === UPowerDevice.Charging)
            return " ";
        return batteryIcons[iconIndex];
    }
    readonly property var batteryIcons: [" ", " ", " ", " ", " "]

    tooltipText: {
        if (!remaningTimeVisible) {
            if (batteryInfo.state === UPowerDevice.Charging)
                return formatRemaningTime(batteryInfo.timeToFull);
            if (batteryInfo.state === UPowerDevice.Discharging)
                return formatRemaningTime(batteryInfo.timeToEmpty);
            return "[full]";
        }
        return (batteryInfo ? Math.round(batteryInfo.percentage * 100) : 0) + "%";
    }

    contentItem: RowLayout {
        spacing: 0

        Text {
            text: getIcon(batteryInfo.state, batteryInfo.percentage)
            font {
                family: Theme.fontSolid
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }

        Text {
            text: {
                if (remaningTimeVisible) {
                    if (batteryInfo.state === UPowerDevice.Charging)
                        return formatRemaningTime(batteryInfo.timeToFull);
                    if (batteryInfo.state === UPowerDevice.Discharging)
                        return formatRemaningTime(batteryInfo.timeToEmpty);
                    return "[full]";
                }
                return (batteryInfo ? Math.round(batteryInfo.percentage * 100) : 0) + "%";
            }

            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
    }

    function getIcon(state, percentage) {
        if (state === UPowerDevice.Charging)
            return " ";
        if (state === UPowerDevice.FullyCharged)
            return " ";

        const index = Math.floor(Math.min(percentage, 0.99) * batteryIcons.length);
        return batteryIcons[index];
    }

    function formatRemaningTime(seconds) {
        if (seconds <= 0 || isNaN(seconds))
            return "--:--";

        let totalMinutes = Math.floor(seconds / 60);

        let hours = Math.floor(totalMinutes / 60);
        let mins = totalMinutes % 60;

        if (hours > 0) {
            return hours + "h " + (mins < 10 ? "0" + mins : mins) + "m";
        } else {
            return mins + "m";
        }
    }

    onClicked: {
        remaningTimeVisible = !remaningTimeVisible;
    }
}
