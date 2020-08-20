import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3

Item {
    id:root

    signal goHome()
    property real name: 0

    Image {
        id: image1_Id
        anchors.centerIn: parent
        source: "qrc:/image/image/edit-tools.png"
        sourceSize:"80x80"
        RotationAnimation{
            target: image1_Id
            from:25
            to:385
            running: true
            loops: Animation.Infinite
            duration: 4000
        }
    }

    Image {
        id: image2_Id
        sourceSize:"40x40"
//        anchors.verticalCenterOffset: -45
//        anchors.horizontalCenterOffset: 45
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter
        anchors{
            bottom: image1_Id.top
            left:image1_Id.right
            topMargin: -10
            leftMargin: -10
        }

        source:"qrc:/image/image/edit-tools.png"
        //fillMode: Image.PreserveAspectFit
        RotationAnimation{
            target: image2_Id
            from:0
            to:-360
            running: true
            loops: Animation.Infinite
            duration: 4000
        }
    }

    ProgressBar {
        id: progressBar_Id
        anchors.verticalCenterOffset: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        value:root.name
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 6
            color: "#e6e6e6"
            radius: 3
        }
        contentItem: Item {
            implicitWidth: 150
            implicitHeight: 4

            Rectangle {
                width: progressBar_Id.visualPosition * parent.width
                height: parent.height
                radius: 2
                color: "#17a81a"
            }
        }
    }
    Timer{
        interval:10
        running: true
        repeat: true
        onTriggered:{
            if(root.name > 1)
            {
                stop()
                timer_Id.start();
            }
            root.name+=0.008
            //console.log(window.name)
        }
    }


    Timer{
        id:timer_Id
        interval: 100
        repeat: true
        onTriggered: {
            if(Corona.secret)
            {
                goHome()
                stop();
            }

        }
    }
}
