import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Page{
    id:root
    anchors.fill: parent

    signal goCountry(string country_name)
    property var countriesName

    Component.onCompleted: {
        countriesName = Corona.getCountry()
        //        console.log(countriesName)
    }

    Pane{
        y:10
        anchors.horizontalCenter: parent.horizontalCenter
        width: root.width - 50
        height: 80
        Material.elevation: 6
        Material.background: "skyblue"

        RowLayout{
            anchors.fill: parent
            //1
            TextField{
                id:textField_Id
                placeholderText: "Country's name"
                Layout.fillWidth: true
                font{family: firstFont_Id.name ; pointSize: 18}
            }
            //2
            Button{
                text: "Search"
                Material.background: "#ffdbcc"
                font{family: firstFont_Id.name ; pointSize: 16}
                onClicked: {
                    if(textField_Id.text!="")
                    {
                        Corona.connection(textField_Id.text)
                        timer2_Id.start()
                    }
                }
            }
        }
        Timer{
            id:timer2_Id
            interval: 100
            repeat: true
            onTriggered: {
                if(Corona.secretC){
                    timer2_Id.stop()
                    goCountry(textField_Id.text)
                    console.log("ok")
                }
                else{
                    console.log("no")
                }

            }
        }
    }
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ listView
    Item{
        id:listModeItem_Id
        y:100 + 50
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 50
        height: parent.height - y
        //        clip: true


        ListView{
            id:listView_Id
            anchors.fill: parent
            spacing: 10
            model: 186
            delegate: Pane{
                width: listModeItem_Id.width
                height: 50
                Material.background:rainBowColor(index)
                Material.elevation: 6

                RowLayout{
                    anchors.fill: parent
                    //1
                    Label{
                        id:label_Id
                        text:countriesName[index]
                        font{family: firstFont_Id.name ; pointSize: 20 ; letterSpacing: 1}

                    }
                    //2.5
                    Item{Layout.fillWidth: true}
                    //2
                    Image{
                        source:"qrc:/image/image/search.png"
                        fillMode: Image.PreserveAspectFit
                        sourceSize: "30x30"
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        Corona.connection(countriesName[index])
                        timer_Id.start()
                    }
                }
                Timer{
                    id:timer_Id
                    interval: 100
                    repeat: true
                    onTriggered: {
                        if(Corona.secretC)
                        {
                            timer_Id.stop()
                            goCountry(label_Id.text)
                            console.log("ok")
                        }
                        else{
                            console.log("no")
                        }
                    }
                }
            }
        }
    }

    function rainBowColor(index){
        if(index%7 == 0)
            return "#ff968a"
        else if(index%7 == 1)
            return "#ffc8a2"
        else if(index%7 == 2)
            return "#ffffb5"
        else if(index%7 == 3)
            return "#b6cfb6"
        else if(index%7 == 4)
            return "#abdee6"
        else if(index%7 == 5)
            return "#97c1a9"
        else if(index%7 == 6)
            return "#cbaacb"
    }

}
