import QtQuick
import QtQuick.Controls
import WORLD

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#73a8bd"

    Text {
        id: helloTxt
        text: qsTr("world World WORLD")
        anchors.top: parent.top
        font.pointSize: 50
        anchors.left: parent.left
        font.family: Constants.font.family
    }

    MyMap {
        id: map
        visible: false
    }

    Button {
        id: backBtn
        anchors.top: helloTxt.bottom
        anchors.topMargin: 0
        text: qsTr("back")
        Connections {
            function onClicked() {
                stackView.pop()
            }
        }
    }

    StackView {
        id: stackView
        anchors.top: backBtn.bottom
        anchors.topMargin: 20
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        initialItem: navRoot

        pushEnter: Transition {
            ParallelAnimation {
                XAnimator {
                    from: 500
                    to: 0
                    duration: 300
                    easing.type: Easing.OutQuad
                }

                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 0
                }
            }
        }

        pushExit: Transition {
            ParallelAnimation {
                XAnimator {
                    from: 0
                    to: -640
                    duration: 400
                    easing.type: Easing.OutQuad
                }

                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 300
                }
            }
        }

        popEnter: Transition {
            ParallelAnimation {
                XAnimator {
                    from: -640
                    to: 0
                    duration: 300
                    easing.type: Easing.OutQuad
                }

                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 300
                }
            }
        }

        popExit: Transition {
            ParallelAnimation {
                XAnimator {
                    from: 0
                    to: 1920
                    duration: 300
                    easing.type: Easing.OutQuad
                }

                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 300
                }
            }
        }

        Column {
            id: navRoot

            Button {
                id: button
                text: qsTr("map")
                Connections {
                    function onClicked() {
                        stackView.push(map)
                    }
                }
            }
        }
    }
}
