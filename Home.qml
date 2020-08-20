import QtQuick 2.14
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.14
import QtQuick.Controls.Material 2.3

Page {
//    signal goToPrevent()
    property var globalInfos
    Component.onCompleted:{
        globalInfos = Corona.getGlobalInfo()
        date_Id.text = Corona.date
    }

    Image {
        id: bug
        y:-50
        source: "qrc:/image/image/people.jpg"
        width: parent.width
        fillMode: Image.PreserveAspectFit
        smooth: true
        visible: false
        z:3
    }
    Rectangle {
        id: mask
        y:-50
        width: bug.width
        height: bug.height
        radius: 100
        smooth: true
        visible: false
        z:3
    }
    OpacityMask {
        anchors.fill: bug
        source: bug
        maskSource: mask
        z:3
    }




    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Pane

    //1
    Pane{
        id:first
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: bug.bottom
            topMargin: -10
        }

        width: parent.width - 50
        height: 90
        Material.elevation: 8
        Material.background: "skyblue"
        //        Material.foreground: Material.Pink
        RowLayout{
            anchors.fill: parent
            Label{
                text: "Date"
                font{family:firstFont_Id.name ; pointSize: 25}
                Material.foreground: Material.Pink
            }
            Item{Layout.fillWidth: true}
            Label{
                id:date_Id
//                text: Corona.date
                font{family:secondFont_Id.name ; pointSize: 18}
                color: Material.color(Material.BlueGrey)
            }
        }

    }
    //2
    Row{
        id:topRow_Id
        anchors.top: first.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        Pane{
            id:second
            width: first.width/2 - 5
            height: first.height * 2
            Material.elevation: 8
            Material.background: "skyblue"

            Label{
                x:-10;y:-15
                text: "Total Confirmed"
                font{family:firstFont_Id.name ; pointSize: 20}
                Material.foreground: Material.Pink
            }
            Label{
                id:totalConfirmed_Id
                anchors.centerIn: parent
                text: globalInfos[3]
                font{family:secondFont_Id.name ; pointSize: 25}
                color: Material.color(Material.BlueGrey)
            }

        }
        Column{
            spacing: 10
            Pane{
                id:third
                width: first.width/2 - 5
                height: second.height / 2 - 5
                Material.elevation: 8
                Material.background: "skyblue"

                Label{
                    x:-10;y:-15
                    text: "Total Deaths"
                    font{family:firstFont_Id.name ; pointSize: 20}
                    Material.foreground: Material.Pink
                }
                Label{
                    id:totalDeaths_Id
                    anchors{
                        right: parent.right
                        bottom: parent.bottom
                    }
                    text: globalInfos[4]
                    font{family:secondFont_Id.name ; pointSize: 20}
                    color: Material.color(Material.BlueGrey)
                }
            }
            Pane{
                id:forth
                width: first.width/2 - 5
                height: second.height / 2 - 5
                Material.elevation: 8
                Material.background: "skyblue"

                Label{
                    x:-10;y:-15
                    text: "New Deaths"
                    font{family:firstFont_Id.name ; pointSize: 20}
                    Material.foreground: Material.Pink
                }
                Label{
                    id:newDeaths_Id
                    anchors{
                        right: parent.right
                        bottom: parent.bottom
                    }
                    text: globalInfos[1]
                    font{family:secondFont_Id.name ; pointSize: 20}
                    color: Material.color(Material.BlueGrey)
                }

            }
        }
    }
    Row{
        anchors.top: topRow_Id.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Column{
            spacing: 10
            Pane{
                id:fifth
                width: first.width/2 - 5
                height: second.height / 2 - 5
                Material.elevation: 8
                Material.background: "skyblue"

                Label{
                    x:-10;y:-15
                    text: "Total Recovered"
                    font{family:firstFont_Id.name ; pointSize: 20}
                    Material.foreground: Material.Pink
                }
                Label{
                    id:totalRecovered_Id
                    anchors{
                        right: parent.right
                        bottom: parent.bottom
                    }
                    text: globalInfos[5]
                    font{family:secondFont_Id.name ; pointSize: 20}
                    color: Material.color(Material.BlueGrey)
                }
            }
            Pane{
                id:sixth
                width: first.width/2 - 5
                height: second.height / 2 - 5
                Material.elevation: 8
                Material.background: "skyblue"

                Label{
                    x:-10;y:-15
                    text: "New Recovered"
                    font{family:firstFont_Id.name ; pointSize: 20}
                    Material.foreground: Material.Pink
                }
                Label{
                    id:newRecovered_Id
                    anchors{
                        right: parent.right
                        bottom: parent.bottom
                    }
                    text: globalInfos[2]
                    font{family:secondFont_Id.name ; pointSize: 20}
                    color: Material.color(Material.BlueGrey)
                }
            }
        }
        Pane{
            id:seventh
            width: first.width/2 - 5
            height: first.height*2
            Material.elevation: 8
            Material.background: "skyblue"

            Label{
                x:-10;y:-15
                text: "New Confirmed"
                font{family:firstFont_Id.name ; pointSize: 20}
                Material.foreground: Material.Pink
            }
            Label{
                id:newConfirmed_Id
                anchors.centerIn: parent
                text: globalInfos[0]
                font{family:secondFont_Id.name ; pointSize: 25}
                color: Material.color(Material.BlueGrey)
            }
        }
    }
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  Footer

}
