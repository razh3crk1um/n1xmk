// Cpu.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../../common"
import "../../style"

TopbarItem {
    id: cpuRoot

    screen: root.screen
    hlColor: Theme.colorBrightYellow
    interactive: false
    inverted: false

    property int cpuUsage: 0
    property real lastTotal: 0
    property real lastIdle: 0
    property var breakdown: ({
            user: 0,
            nice: 0,
            sys: 0,
            iowait: 0,
            irq: 0,
            softirq: 0,
            steal: 0
        })
    property var lastRaw: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    tooltipText: {
        const b = breakdown;
        const fmt = (label, v) => v > 0 ? `${label} ${String(v).padStart(2)}%` : "";
        const row2 = ["user", "nice", "sys"].map(k => fmt(k, b[k])).filter(Boolean).join("  ·  ");
        const row3 = ["iowait", "irq", "steal"].map(k => fmt(k, b[k])).filter(Boolean).join("  ·  ");
        return `CPU  ${cpuUsage}%\n${row2}${row3 ? "\n" + row3 : ""}`;
    }

    contentItem: RowLayout {
        spacing: 0

        Text {
            text: " "
            font {
                family: Theme.fontSolid
                pixelSize: Theme.fontSize
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }

        Text {
            text: cpuUsage + "%"
            font {
                pixelSize: Theme.fontSize
                bold: true
            }
            color: fg
            Layout.alignment: Qt.AlignBaseline
        }
    }

    Process {
        id: cpuProcess
        command: ["sh", "-c", "head -1 /proc/stat; echo"]  // echo toggle SplitParser
        stdout: SplitParser {
            onRead: data => {
                const p = data.trim().split(/\s+/);
                if (p[0] !== "cpu" || p.length < 9)
                    return;

                const idle = parseInt(p[4]) + parseInt(p[5]);
                const total = p.slice(1, 9).reduce((a, b) => a + parseInt(b), 0);
                const dt = total - lastTotal;

                if (lastTotal > 0 && dt > 0) {
                    cpuUsage = Math.round(100 * (1 - (idle - lastIdle) / dt));
                    const pct = i => Math.round(100 * (parseInt(p[i]) - lastRaw[i]) / dt);
                    breakdown = {
                        user: pct(1),
                        nice: pct(2),
                        sys: pct(3),
                        iowait: pct(5),
                        irq: pct(6),
                        softirq: pct(7),
                        steal: pct(8)
                    };
                }

                lastRaw = p.map(v => parseInt(v) || 0);  // 整行存下来，下标天然对齐
                lastTotal = total;
                lastIdle = idle;
            }
        }
        running: false
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProcess.running = false;
            cpuProcess.running = true;
        }
    }
}
