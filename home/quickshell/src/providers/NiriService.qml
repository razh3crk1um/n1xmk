// NiriService.qml (Singleton)
pragma Singleton

import QtQuick
import Quickshell
import Niri 0.1

Singleton {
    property alias workspaces: niri.workspaces
    property alias windows: niri.windows
    property alias focusedWindow: niri.focusedWindow

    function focusWorkspaceById(id) {
        niri.focusWorkspaceById(id);
    }

    property var _niri: Niri {
        id: niri
        Component.onCompleted: connect()
        onErrorOccurred: e => console.log("Niri: ", e)
    }
    Component.onCompleted: niri.workspaces.maxCount = 10

    readonly property var workspaceIcons: ({
            "1": "",
            "2": "",
            "3": "",
            "4": "",
            "5": "",
            "6": "",
            "7": "",
            "8": "",
            "default": ""
        })

    // readonly property var workspaceIcons: ({
    //     "1": { glyph: "", font: Theme.fontSolid },
    //     "2": { glyph: "", font: Theme.fontSolid },
    //     "3": { glyph: "", font: Theme.fontSolid },
    //     "4": { glyph: "", font: Theme.fontSolid },
    //     "5": { glyph: "", font: Theme.fontSolid },
    //     "6": { glyph: "", font: Theme.fontSolid },
    //     "7": { glyph: "", font: Theme.fontSolid },
    //     "8": { glyph: "", font: Theme.fontSolid },
    //     "default": { glyph: "", font: Theme.fontSolid },
    // })

    function workspaceIcon(ws) {
        //  name > index > fallback
        const key = ws.name || String(ws.index);
        return workspaceIcons[key] ?? workspaceIcons["default"];
    }
}
