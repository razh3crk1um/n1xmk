// Tray.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import "../../common"
import "../../style"

Rectangle {
    id: trayRoot

    implicitWidth: contentArea.implicitWidth + horizontalPadding
    Layout.fillHeight: true
    color: Theme.colorBlack

    readonly property int horizontalPadding: 4
    readonly property real defaultIndicatorHeight: 2

    Rectangle {
        id: indicator
        height: defaultIndicatorHeight
        width: parent.width
        color: Theme.colorBrightBlack
        anchors.top: parent.top
    }

    RowLayout {
        id: contentArea
        spacing: 0
        anchors {
            top: indicator.bottom
            bottom: parent.bottom
            right: parent.right
            horizontalCenter: parent.horizontalCenter
        }

        Repeater {
            model: SystemTray.items

            delegate: Item {
                id: itemRoot
                required property var modelData
                readonly property SystemTrayItem trayItem: modelData
                readonly property bool hovered: mouseArea.containsMouse

                implicitWidth: (trayItem?.icon ? 16 : 0) + 10
                implicitHeight: root.height - defaultIndicatorHeight

                // 图标路径解析
                readonly property string _raw: trayItem?.icon ?? ""
                // 处理 Quickshell 特有的双斜杠或绝对路径
                readonly property bool _isAbsFile: _raw.startsWith("image://icon//") || _raw.startsWith("/")

                readonly property string _src: {
                    if (!_raw)
                        return "";
                    if (_isAbsFile) {
                        // 提取真实路径并补全 file:// 协议
                        let path = _raw;
                        if (path.startsWith("image://icon//")) {
                            path = path.substring("image://icon/".length);
                        }
                        const q = path.indexOf("?");
                        const realPath = q !== -1 ? path.substring(0, q) : path;
                        return realPath.startsWith("/") ? "file://" + realPath : realPath;
                    }
                    // 处理主题图标，去掉可能存在的 ?path= 后缀
                    const q = _raw.indexOf("?path=");
                    return q !== -1 ? _raw.substring(0, q) : _raw;
                }

                // icon theme
                IconImage {
                    anchors.centerIn: parent
                    implicitSize: 16
                    visible: !itemRoot._isAbsFile
                    source: itemRoot._isAbsFile ? "" : itemRoot._src
                }

                // icon pixel
                Image {
                    anchors.centerIn: parent
                    width: 16
                    height: 16
                    sourceSize: Qt.size(width * Screen.devicePixelRatio, height * Screen.devicePixelRatio)
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    visible: itemRoot._isAbsFile
                    source: itemRoot._isAbsFile ? itemRoot._src : ""
                }

                QsMenuAnchor {
                    id: menuAnchor
                    menu: itemRoot.trayItem?.menu ?? null
                    // QsWindow.window 会自动查找所属窗口
                    anchor.window: QsWindow.window
                    anchor.edges: Edges.Top
                    anchor.gravity: Edges.Top
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                    onClicked: mouse => {
                        if (mouse.button === Qt.RightButton || (mouse.button === Qt.LeftButton && itemRoot.trayItem?.onlyMenu)) {
                            if (itemRoot.trayItem?.hasMenu) {
                                const pos = itemRoot.mapToItem(null, 0, 0);
                                menuAnchor.anchor.rect = Qt.rect(pos.x, pos.y, itemRoot.width, itemRoot.height);
                                menuAnchor.open();
                            } else {
                                itemRoot.trayItem?.activate();
                            }
                        } else if (mouse.button === Qt.LeftButton) {
                            itemRoot.trayItem?.activate();
                        } else if (mouse.button === Qt.MiddleButton) {
                            itemRoot.trayItem?.secondaryActivate();
                        }
                    }

                    onWheel: wheel => {
                        if (wheel.angleDelta.y !== 0)
                            itemRoot.trayItem?.scroll(wheel.angleDelta.y / 120, false);
                        if (wheel.angleDelta.x !== 0)
                            itemRoot.trayItem?.scroll(wheel.angleDelta.x / 120, true);
                    }
                }
                ToolTip {
                    targetModule: itemRoot
                    sourceScreen: root.screen
                    text: {
                        if (!trayItem)
                            return "";
                        let name = trayItem.title || trayItem.id || "undefined";
                        return name.split('/').pop();
                    }
                }
            }
        }
    }
}

// -----------------------------------------------------------------------------
// Fix
//
// WARN: Could not load icon "view-refresh" at size QSize(32, 32) from request
// WARN: Could not load icon "application-exit" at size QSize(32, 32) from request
//
// mkdir -p ~/.local/share/icons/hicolor/32x32/actions
//
// cd ~/.local/share/icons/hicolor/32x32/actions
//
// ln -sf /etc/profiles/per-user/$USER/share/icons/Adwaita/symbolic/actions/view-refresh-symbolic.svg view-refresh.svg
//
// ln -sf /etc/profiles/per-user/$USER/share/icons/Adwaita/symbolic/actions/application-exit-symbolic.svg application-exit.svg
//
// -----------------------------------------------------------------------------

