import QtQuick 2.14
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
Item {
    id: name

    signal goHome()

    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent

        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ page1

        Page {
            id: firstPage
            ColumnLayout{
                anchors.centerIn: parent
                spacing: 40
                //1
                Image{
                    Layout.alignment: Qt.AlignHCenter
                    sourceSize: "300x300"
                    source: "qrc:/image/image/stay-home.png"
                    fillMode: Image.PreserveAspectFit
                }
                //1.5
                Item{height: 10}
                //2
                Label{
                    id:firstPageTitle_Id
                    Layout.alignment: Qt.AlignHCenter
                    text: "Stay Home"
                    font{family: "Tahoma" ; pointSize: 20 ;}
                    color: "orange"
                }
                //2.5
                Item{height: 30}
                //3
                Label {
                    width: 200
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "First Time In History We Can Save The Human Race By\nLying In Frot Of The T.V And Doing Nothing\n Lets Not Screw Up";
                    font{pointSize: 10}
                    color: "gray"
                }
                //3.5
                Item{height: 50}
            }
            Button{
                anchors{
                    right: parent.right
                    bottom: parent.bottom
                    bottomMargin: 50
                    rightMargin: 20
                }
                text: "next"
                onClicked: {
                    view.currentIndex = 1
                }
            }
            Button{
                anchors{
                    left: parent.left
                    bottom: parent.bottom
                    bottomMargin: 50
                    leftMargin: 20
                }
                text: "pre"
                //                enabled: false
            }
        }
        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ page2

        Page {
            id: secondPage
            //1
            ColumnLayout{
                anchors.centerIn: parent
                spacing: 40
                //1
                Image{
                    Layout.alignment: Qt.AlignHCenter
                    source: "qrc:/image/image/social-distancing.png"
                    fillMode: Image.PreserveAspectFit
                    sourceSize: "300x300"
                }
                //1.5
                Item{height: 10}
                //2
                Label{
                    Layout.alignment: Qt.AlignHCenter
                    text: "Distance"
                    font{family: "Tahoma" ; pointSize: 20}
                    color:"orange"
                }
                //2.5
                Item{height: 30}
                //3
                Label {
                    width: 200
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "make sure you don’t get too close to other people\nkeeping your distance will protect you.\nIn general, keep a 6 ft (2 m) circle of personal space around you."
                    font{pointSize: 10}
                    color: "gray"
                }
                //3.5
                Item{height:50}
            }
            Button{
                anchors{
                    right: parent.right
                    bottom: parent.bottom
                    bottomMargin: 50
                    rightMargin: 20
                }
                text: "next"
                onClicked: {
                    view.currentIndex = 2
                }
            }
            Button{
                anchors{
                    left: parent.left
                    bottom: parent.bottom
                    bottomMargin: 50
                    leftMargin: 20
                }
                text: "pre"
                onClicked: {
                    view.currentIndex = 0
                }
            }
        }

        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ page3

        Page {
            id: thirdPage

            ColumnLayout{
                anchors.centerIn: parent
                spacing: 40
                //1
                Row{
                    Layout.alignment: Qt.AlignHCenter
                    width: parent.width - 20
                    //                height: 300
                    Image{
                        id:image_Id
                        source: "qrc:/image/image/face-mask.png"
                        fillMode: Image.PreserveAspectFit
                        width: thirdPage.width/2-10
                    }
                    Image{
                        source: "qrc:/image/image/face-mask (1).png"
                        fillMode: Image.PreserveAspectFit
                        width: thirdPage.width/2-10
                    }
                }
                //1.5
                Item{height: 10}
                //2
                Label{
                    Layout.alignment: Qt.AlignHCenter
                    text: "Mask"
                    font{family: "Tahoma" ; pointSize: 20}
                    color:"orange"
                }
                //2.5
                Item{height: 30}
                //3
                Label {
                    width: 200
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "Wear a cloth mask or cover over your nose and mouth when in public.\nThe CDC recommends even healthy people in the US\nwear cloth coverings when expecting toencounter others in public"
                    font{pointSize: 10}
                    color: "gray"
                }
                //3.5
                Item{height:50}
            }
            Button{
                anchors{
                    right: parent.right
                    bottom: parent.bottom
                    bottomMargin: 50
                    rightMargin: 20
                }
                text: "next"
                onClicked: {
                    view.currentIndex = 3
                }
            }
            Button{
                anchors{
                    left: parent.left
                    bottom: parent.bottom
                    bottomMargin: 50
                    leftMargin: 20
                }
                text: "pre"
                onClicked: {
                    view.currentIndex = 1
                }
            }

        }

        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ page4

        Page {
            id: forthPage
            ColumnLayout{
                anchors.centerIn: parent
                spacing: 40
                //1
                Image{
                    Layout.alignment: Qt.AlignHCenter
                    source: "qrc:/image/image/hand-wash.png"
                    fillMode: Image.PreserveAspectFit
                    sourceSize: "300x300"
                }
                //1.5
                Item{height: 10}
                //2
                Label{
                    Layout.alignment: Qt.AlignHCenter
                    text: "Hand Wash"
                    font{family: "Tahoma" ; pointSize: 20}
                    color:"orange"
                }
                //2.5
                Item{height: 30}
                //3
                Label {
                    width: 200
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "Wash your hands with soap and water to minimize your infection risk.\nThe best way to prevent COVID-19 is to wash your hands as often as possible.\n Wet your hands with warm water, then apply a mild soap."
                    font{pointSize: 10}
                    color: "gray"
                }
                //3.5
                Item{height:50}
            }
            Button{
                anchors{
                    right: parent.right
                    bottom: parent.bottom
                    bottomMargin: 50
                    rightMargin: 20
                }
                text: "next"
                onClicked: {
                    view.currentIndex = 4
                }
            }
            Button{
                anchors{
                    left: parent.left
                    bottom: parent.bottom
                    bottomMargin: 50
                    leftMargin: 20
                }
                text: "pre"
                onClicked: {
                    view.currentIndex = 2
                }
            }
        }

        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ page5

        Page {
            id: fifthPage
            ColumnLayout{
                anchors.centerIn: parent
                spacing: 40
                //1
                Image{
                    Layout.alignment: Qt.AlignHCenter
                    source: "qrc:/image/image/vegetable.png"
                    fillMode: Image.PreserveAspectFit
                    sourceSize: "300x300"
                }
                //1.5
                Item{height: 10}
                //2
                Label{
                    Layout.alignment: Qt.AlignHCenter
                    text: "Eat Healthy"
                    font{family: "Tahoma" ; pointSize: 20}
                    color:"orange"
                }
                //2.5
                Item{height: 30}
                //3
                Label {
                    width: 200
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "The foods you eat have big effects on your health and quality of life.\nAlthough eating healthy can be fairly simple\nthe rise in popular diets and dieting trends has caused confusion."
                    font{pointSize: 10}
                    color: "gray"
                }
                //3.5
                Item{height:50}
            }
            Button{
                anchors{
                    right: parent.right
                    bottom: parent.bottom
                    bottomMargin: 50
                    rightMargin: 20
                }
                text: "home"
                onClicked: {
                    goHome();
                }
            }
            Button{
                anchors{
                    left: parent.left
                    bottom: parent.bottom
                    bottomMargin: 50
                    leftMargin: 20
                }
                text: "pre"
                onClicked: {
                    view.currentIndex = 3
                }
            }
        }
    }


    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
