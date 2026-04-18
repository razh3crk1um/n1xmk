// CornerBR.qml  ╱  下右三角（右下角是直角，左上透明）
import QtQuick

import "../style"

Item {
    width: Theme.cornerWidth
    height: Theme.cornerHeight
    Canvas {
        anchors.fill: parent
        onPaint: {
            const c = getContext("2d");
            c.clearRect(0, 0, width, height);
            c.fillStyle = Theme.colorBlack;
            c.beginPath();
            c.moveTo(0, 0);         // 左上
            c.lineTo(width, 0);     // 右上
            c.lineTo(width, height);// 右下
            c.closePath();
            c.fill();
        }
    }
}
