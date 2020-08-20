import QtQuick 2.14
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import QtCharts 2.3

Page {
    id:root

    property string country_name
    property var country_info
    property variant country_info_lastMonth_confirmed

    Component.onCompleted: {
        country_info = Corona.getCountriesInfos()
        country_info_lastMonth_confirmed = Corona.getCountryLastMonthConfirmed()
        console.log(country_info_lastMonth_confirmed)
    }

    Flickable{
        id:flickable_Id
        width: parent.width
        height: parent.height
        contentHeight: parent.height*2
        contentWidth: parent.width
        interactive: true
        boundsBehavior: Flickable.StopAtBounds

        Column{
            width: root.width
            height: flickable_Id.height

            Pane{
                id:topPane_Id
                width: root.width
                height: root.height/4
                Material.background: Material.DeepPurple
                Material.elevation: 6

                Label{
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        topMargin: 20
                    }

                    text: root.country_name
                    font{family: firstFont_Id.name ; pointSize: 30}
                    color:"skyblue"
                }
                Image{
                    source: "qrc:/image/image/virus.png"
                    sourceSize: "100x100"
                    anchors.bottom: parent.bottom
                    opacity: 0.6
                }
            }
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ chartView
            SwipeView{
                id:swipeView_Id
                //                anchors.top: topPane_Id.bottom
                currentIndex: 0
                width: parent.width
                height: 300
                //1

                ChartView{
                    id:pieChartTotal_Id
                    antialiasing: true
                    animationOptions: ChartView.AllAnimations
                    animationDuration: 1000
                    title: "Total"
                    PieSeries{
                        name:"paghsa"
                        PieSlice{
                            value: country_info[0]
                            label: "Confirmed"
                            color: "lightblue"
                        }
                        PieSlice{
                            value: country_info[2]
                            label: "Deaths"
                            color: "tomato"
                        }
                        PieSlice{
                            value: country_info[4]
                            label: "Recovered"
                            color: "lightgreen"
                        }
                    }
                }
                //2
                ChartView{
                    id:pieChartNew_Id
                    antialiasing: true
                    animationOptions: ChartView.AllAnimations
                    animationDuration: 1000
                    title: "New"
                    PieSeries{
                        name:"paghsa"
                        PieSlice{
                            value: country_info[1]
                            label: "Confirmed"
                            color: "lightblue"
                        }
                        PieSlice{
                            value: country_info[3]
                            label: "Deaths"
                            color: "tomato"
                        }
                        PieSlice{
                            value: country_info[5]
                            label: "Recovered"
                            color: "lightgreen"
                        }
                    }
                }

            }
            PageIndicator {
                id: indicator
                count: swipeView_Id.count
                currentIndex: swipeView_Id.currentIndex
                //                anchors.bottom: swipeView_Id.bottom
                //                anchors.topMargin: -20

                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                //1
                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 10
                    Pane{
                        spacing: 10
                        width: (root.width-50)/2
                        height: 100
                        Material.background: Material.DeepPurple
                        Material.elevation: 6
                        opacity: 1

                        Label{
                            x:-10;y:-15
                            text: "Total Confirmed"
                            font{family:firstFont_Id.name ; pointSize: 20}
                            Material.foreground: "skyblue"
                        }
                        Label{
                            id:totalConfirmed_Id
                            anchors{
                                right: parent.right
                                bottom: parent.bottom
                            }
                            text: country_info[0]
                            font{family:secondFont_Id.name ; pointSize: 20}
                            color: Material.color(Material.LightBlue)
                        }
                    }
                    Pane{
                        width: (root.width-50)/2
                        height: 100
                        Material.background: Material.DeepPurple
                        Material.elevation: 6
                        opacity: 1

                        Label{
                            x:-10;y:-15
                            text: "Total Deaths"
                            font{family:firstFont_Id.name ; pointSize: 20}
                            Material.foreground: "skyblue"
                        }
                        Label{
                            id:totalDeaths_Id
                            anchors{
                                right: parent.right
                                bottom: parent.bottom
                            }
                            text: country_info[2]
                            font{family:secondFont_Id.name ; pointSize: 20}
                            color: Material.color(Material.LightBlue)
                        }
                    }
                }
                //2
                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 10
                    Pane{
                        width: (root.width - 50)/2
                        height: 100
                        Material.background: Material.DeepPurple
                        Material.elevation: 6
                        opacity: 1

                        Label{
                            x:-10;y:-15
                            text: "New Confirmed"
                            font{family:firstFont_Id.name ; pointSize: 20}
                            Material.foreground: "skyblue"
                        }
                        Label{
                            id:newConfirmed_Id
                            anchors{
                                right: parent.right
                                bottom: parent.bottom
                            }
                            text: country_info[1]
                            font{family:secondFont_Id.name ; pointSize: 20}
                            color: Material.color(Material.LightBlue)
                        }
                    }
                    Pane{
                        width: (root.width - 50)/2
                        height: 100
                        Material.background: Material.DeepPurple
                        Material.elevation: 6
                        opacity: 1

                        Label{
                            x:-10;y:-15
                            text: "New Deaths"
                            font{family:firstFont_Id.name ; pointSize: 20}
                            Material.foreground: "skyblue"
                        }
                        Label{
                            id:newDeaths_Id
                            anchors{
                                right: parent.right
                                bottom: parent.bottom
                            }
                            text: country_info[3]
                            font{family:secondFont_Id.name ; pointSize: 20}
                            color: Material.color(Material.LightBlue)
                        }
                    }
                }
            }
        }
        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ page 2
        Item{
            width: root.width
            height: flickable_Id.height
            y:root.height
            Column{
                anchors.fill: parent
                ChartView {
                    title: "Last 30 Days"
                    //                anchors.fill: parent
                    legend.alignment: Qt.AlignBottom
                    width: parent.width
                    height: root.height/2
                    antialiasing: true
                    animationOptions: ChartView.AllAnimations
                    animationDuration: 8000

                    BarSeries {
                        id: mySeries
                        //                    axisY: 4000
                        axisX: BarCategoryAxis { categories: [30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1] }
                        BarSet { label: "Confirmed"; values: country_info_lastMonth_confirmed }
                        //                    BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
                        //                    BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
                    }
                }
                ChartView {
                    title: "Line"
                    //                anchors.fill: parent
                    antialiasing: true
                    height: flickable_Id.height/2
                    width: parent.width

                    LineSeries {
                        name: "LineSeries"

                        XYPoint { x: 0; y: 0 }
                        XYPoint { x: 1.1; y: 2.1 }
                        XYPoint { x: 1.9; y: 3.3 }
                        XYPoint { x: 2.1; y: 2.1 }
                        XYPoint { x: 2.9; y: 4.9 }
                        XYPoint { x: 3.4; y: 3.0 }
                        XYPoint { x: 4.1; y: 3.3 }
                    }
                }
            }

        }
    }
}
