// Volume.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

import "../../common"
import "../../style"

TopbarItem {
    id: volumeRoot

    screen: root.screen
    hlColor: Theme.colorMagenta

    property string contentLabel: (ready && !muted) ? Math.round(activeSink.audio.volume * 100) + "%" : "mute"
    readonly property var activeSink: Pipewire.defaultAudioSink
    PwObjectTracker {
        id: tracker
        objects: activeSink ? [activeSink] : []
    }
    readonly property bool ready: activeSink && activeSink.ready
    readonly property bool muted: ready && activeSink.audio ? activeSink.audio.muted : false
    readonly property bool viaBluetooth: {
        if (!ready || !activeSink.properties)
            return false;
        return activeSink.properties["device.api"] === "bluez5" || activeSink.properties["device.bus"] === "bluetooth";
    }

    tooltipText: {
        if (!activeSink)
            return "No Device Connected";

        const props = activeSink.properties || {};
        const desc = activeSink.description || "Unknown Device";
        let name = activeSink.name || "Unknown Name";
        let extra = "";

        if (viaBluetooth) {
            name = props["api.bluez5.address"] || activeSink.name;
            let codec = props["api.bluez5.codec"];
            if (codec)
                extra = ` (${codec.toUpperCase()})`;
        }
        return `${desc}${extra}\n${name}`;
    }

    contentItem: RowLayout {
        spacing: 0

        Text {
            text: muted ? " " : (viaBluetooth ? " " : " ")
            font {
                family: Theme.fontSolid
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }

        Text {
            text: contentLabel
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
    }

    onClicked: {
        if (!ready || !activeSink.audio)
            return;
        activeSink.audio.volume = 0.25;
    }
    onRightClicked: {
        if (ready && activeSink.audio)
            activeSink.audio.muted = !muted;
    }
    onMiddleClicked: {
        pavuLauncher.running = false;
        pavuLauncher.running = true;
    }

    onScrolled: wheel => {
        if (!ready || !activeSink.audio)
            return;
        let audio = activeSink.audio;
        let step = 0.05;
        let delta = wheel.angleDelta.y > 0 ? step : -step;

        // [0, 70]
        let newVolume = Math.max(0, Math.min(0.7, audio.volume + delta));
        audio.volume = newVolume;
    }

    Process {
        id: pavuLauncher
        command: ["pavucontrol"]
        onExited: running = false
    }
}
