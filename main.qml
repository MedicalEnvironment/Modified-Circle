import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    title: "Make transition"

    Rectangle {
        id: scene
        anchors.fill: parent
        state: "LeftState"

        Rectangle {
            id: leftRectangle
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            Text {
                anchors.centerIn: parent
                text: "move"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    scene.state = "RightState"
                    // Move the circle towards the right square (no animation)
                    ball.x += 30
                }
            }
        }

        Rectangle {
            id: rightRectangle
            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            Text {
                anchors.centerIn: parent
                text: "return"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    scene.state = "LeftState"
                }
            }
        }

        Rectangle {
            id: ball
            color: "darkgreen"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2
        }

        states: [
            State {
                name: "RightState"
                PropertyChanges {
                    target: ball
                    x: rightRectangle.x
                }
            },
            State {
                name: "LeftState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5
                }
            }
        ]

        transitions: [
            Transition {
                from: "LeftState"
                to: "RightState"
            },
            Transition {
                from: "RightState"
                to: "LeftState"
                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
