// Topbar.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import "./common"
import "./style"
import "./modules/topbar"

Item {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: Theme.topbarHeight
            color: "transparent"

            RowLayout {
                anchors {
                    fill: parent
                    top: parent.top
                    bottom: parent.bottom
                }
                spacing: 0

                Inhibitor {}
                CornerTL {}
                CornerBR {}
                Workspace {}
                CornerBL {}

                CornerTR {}
                MpdMpris {}
                CornerTL {}

                CornerBR {}
                Title {}
                CornerBL {}

                CornerTR {}
                Network {}
                CornerBL {}

                CornerTR {}
                Cpu {}
                Separator {}
                Memory {}
                Separator {}
                Temperature {}
                CornerBL {}

                CornerTR {}
                Volume {}
                Separator {}
                Battery {}
                Separator {}
                Clock {}
                CornerBL {}

                CornerTR {}
                Tray {}
            }
        }
    }
}
