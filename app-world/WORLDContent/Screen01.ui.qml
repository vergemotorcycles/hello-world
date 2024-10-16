

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.4
import QtQuick.Controls 6.4
import WORLD

Rectangle {
    width: Constants.width
    height: Constants.height
    color: "#73a8bd"

    Text {
        text: qsTr("world World WORLD")
        anchors.top: parent.top
        font.pointSize: 50
        anchors.left: parent.left
        font.family: Constants.font.family
    }
}
