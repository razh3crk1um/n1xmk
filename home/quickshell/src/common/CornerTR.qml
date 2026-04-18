// CornerTR.qml  ╱  上右三角（右上角是直角，左下透明）
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
            c.moveTo(width, 0);      // 右上
            c.lineTo(width, height); // 右下
            c.lineTo(0, height);     // 左下
            c.closePath();
            c.fill();
        }
    }
}
