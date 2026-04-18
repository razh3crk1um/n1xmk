// MpdMpris.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

import "../../common"
import "../../style"

TopbarItem {
    id: mpdMprisRoot

    screen: root.screen
    hlColor: Theme.colorRed
    indicatorVisible: false
    inverted: false
    alignment: Qt.AlignLeft

    property string contentLabel: ""
    readonly property var mpdSource: Mpris.players.values.find(p => p.identity === "MPD")
    readonly property int mpdPlaybackState: mpdSource?.playbackState ?? MprisPlaybackState.Stopped
    readonly property int mpdLoopState: mpdSource?.loopState ?? 0

    property bool localSingleState: false
    readonly property bool mpdSingleMode: mpdLoopState === 1 || (mpdLoopState !== 2 && localSingleState)

    readonly property int absoluteMaxWidth: 200
    readonly property int rawLength: mpdSource?.metadata?.["mpris:length"] || 0
    readonly property string totalTimeText: {
        const us = rawLength;
        if (us <= 0)
            return "0:00";
        const s = Math.floor(us / 1e6);
        const m = Math.floor(s / 60);
        return `${m}:${String(s % 60).padStart(2, "0")}`;
    }
    readonly property string trackSignature: {
        const m = mpdSource?.metadata;
        if (!m)
            return "";
        return (m["xesam:title"] ?? "") + "|" + (m["xesam:album"] ?? "");
    }
    readonly property string contentIcon: {
        if (!mpdSource)
            return "󰝛 ";
        if (mpdPlaybackState === 2)
            return "󰏤 ";
        if (mpdPlaybackState === 1)
            return "󰐊 ";
        if (mpdPlaybackState === 0)
            return "󰓛 ";
        return "󰝛 ";
    }

    tooltipText: {
        if (!mpdSource)
            return "MPD Offline";
        const state = mpdPlaybackState === 1 ? "playing" : "paused";
        const rep = mpdLoopState > 0 ? "on" : "off";
        const ran = mpdSource.shuffle ? "on" : "off";
        const sin = mpdSingleMode ? "on" : "off";
        return `${contentLabel}\n[${state}] · [${totalTimeText}]\nrepeat ${rep} · random ${ran} · single ${sin}`;
    }

    onTrackSignatureChanged: {
        if (trackSignature !== "" && mpdSource)
            trackNameFetcher.startQuery();
    }

    onMpdLoopStateChanged: {
        if (mpdLoopState === 0)
            localSingleState = false;
    }

    contentItem: RowLayout {
        width: mpdMprisRoot.width
        spacing: 0

        Text {
            text: contentIcon
            font {
                family: Theme.fontNerd
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
        Text {
            text: mpdSingleMode ? "󰑘 " : "󰒝 "
            font {
                family: Theme.fontNerd
                pixelSize: Theme.fontSize
            }
            color: fg

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    localSingleState = !localSingleState;
                    mpcSingleToggle.toggle();
                }
            }
        }

        Text {
            text: contentLabel
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            color: fg
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignBaseline
            Layout.maximumWidth: absoluteMaxWidth
            Layout.rightMargin: Theme.cornerWidth
            elide: Text.ElideRight
        }
    }

    Process {
        id: trackNameFetcher
        command: ["sh", "-c", "mpc current -f %file% | sed 's|.*/||; s/\\.[^.]*$//'"]

        function startQuery() {
            running = false;
            running = true;
        }

        stdout: SplitParser {
            onRead: data => {
                const trimmed = data.trim();
                if (trimmed !== "")
                    contentLabel = trimmed;
            }
        }
    }

    Process {
        id: mpcSingleToggle
        command: ["mpc", "single"]
        function toggle() {
            running = false;
            running = true;
        }
    }

    onClicked: {
        mpdSource && (mpdPlaybackState === 1 ? mpdSource.pause() : mpdSource.play());
    }
    onMiddleClicked: {
        mpdSource?.previous();
    }
    onRightClicked: {
        mpdSource?.next();
    }
}
