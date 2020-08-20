import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

ApplicationWindow {
    id:main
    visible: true
    width: 450
    height: 850
    title: qsTr("Hello World")

    Component.onCompleted: loader_Id.sourceComponent = waitingComponent_Id

    property string country_name

    FontLoader{
        id:firstFont_Id
        source:"qrc:/font/font/Dosis-VariableFont_wght.ttf"
    }
    FontLoader{
        id:secondFont_Id
        source:"qrc:/font/font/MavenPro-VariableFont_wght.ttf"
    }

    Loader{
        id:loader_Id
        anchors.fill: parent
    }

    Component{
        id:homeComponent_Id
        Home{
        }
    }

    Component{
        id:preventationComponent_Id
        Preventation{
            onGoHome: loader_Id.sourceComponent = homeComponent_Id
        }
    }

    Component{
        id:searchComponent_Id
        Search{
            onGoCountry:{
                loader_Id.sourceComponent = countryComponent_Id
                 main.country_name = country_name
            }
        }
    }

    Component{
        id:countryComponent_Id
        Country{
            country_name : main.country_name
//            onGoCountry(country_name): loader_Id.sourceComponent = homeComponent_Id
        }
    }

    Component{
        id:waitingComponent_Id
        Waiting{
            onGoHome: loader_Id.sourceComponent = homeComponent_Id
        }
    }

    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ header
    header: ToolBar{
        RowLayout{
            anchors.fill: parent
            ToolButton{
                icon.source: "qrc:/image/image/menu.png"
            }
            Item{
                Layout.fillWidth: true
            }
            ToolButton{
                icon.source: "qrc:/image/image/search.png"
                onClicked: loader_Id.sourceComponent = searchComponent_Id
            }
        }
    }
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ footer
    footer: ToolBar{
        RowLayout{
            anchors.centerIn: parent
            spacing: 40
            ToolButton{
                icon.source: "qrc:/image/image/home.png"
                icon.width: 30
                icon.height: 30
                onClicked: loader_Id.sourceComponent = homeComponent_Id
            }
            ToolButton{
                icon.source: "qrc:/image/image/doctor.png"
                icon.width: 30
                icon.height: 30
                onClicked: loader_Id.sourceComponent = preventationComponent_Id
            }
            ToolButton{
                icon.source: "qrc:/image/image/search.png"
            }
            ToolButton{
                icon.source: "qrc:/image/image/search.png"
            }
        }
    }
}

