// NotifService.qml (Singleton)
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property ListModel activeToasts: ListModel {}
    property ListModel history: ListModel {}
    property bool centerOpen: false

    NotificationServer {
        actionsSupported: true
        bodySupported: true
        bodyMarkupSupported: true
        imageSupported: true
        persistenceSupported: true
        keepOnReload: true

        onNotification: function (notif) {
            notif.tracked = true;

            root.activeToasts.append({
                "currentNotification": notif
            });

            const MAX_ITEMS = 50;
            if (!notif.transient) {
                root.history.insert(0, {
                    "appName": notif.appName,
                    "summary": notif.summary,
                    "body": notif.body,
                    "appIcon": notif.appIcon,
                    "timestamp": Qt.formatDateTime(new Date(), "MM-dd HH:mm:ss")
                });
            }
            if (root.history.count > MAX_ITEMS) {
                root.history.remove(MAX_ITEMS, root.history.count - MAX_ITEMS);
            }
        }
    }

    function removeToast(currentNotification) {
        for (var i = 0; i < root.activeToasts.count; i++) {
            if (root.activeToasts.get(i).currentNotification === currentNotification) {
                root.activeToasts.remove(i);
                break;
            }
        }
    }

    function dismissAll() {
        for (var i = root.activeToasts.count - 1; i >= 0; i--) {
            var n = root.activeToasts.get(i).currentNotification;
            if (n && n.tracked)
                n.dismiss();
        }
        root.activeToasts.clear();
    }

    function clearHistory() {
        root.history.clear();
    }
}
