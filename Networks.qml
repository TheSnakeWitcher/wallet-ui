import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtGraphicalEffects 1.15
import QtQml 2.15

// Network selector dropdown (this would appear when clicking on the network indicator in the sidebar)
Rectangle {
    id: networkSelector
    width: 250
    height: 400
    radius: 12
    color: cardBgColor
    visible: false // Only shown when network selection is active
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        
        Text {
            text: "Select Network"
            color: textColor
            font.bold: true
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter
        }
        
        PlasmaComponents.TextField {
            Layout.fillWidth: true
            placeholderText: "Search networks"
            background: Rectangle {
                color: Qt.darker(cardBgColor, 1.1)
                radius: 6
            }
        }
        
        ListView {
            id: networkSelectorList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 5
            
            model: NetworkList {}
            
            delegate: Rectangle {
                width: networkSelectorList.width
                height: 50
                radius: 6
                color: isActive ? Qt.lighter(cardBgColor, 1.3) : Qt.darker(cardBgColor, 1.1)
                
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Update active network and close selector
                        currentNetwork = name;
                        currentNetworkColor = iconColor;
                        networkSelector.visible = false;
                    }
                }
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 10
                    
                    Rectangle {
                        width: 12
                        height: 12
                        radius: width / 2
                        color: isActive ? positiveColor : "transparent"
                        border.width: isActive ? 0 : 1
                        border.color: isActive ? "transparent" : dividerColor
                    }
                    
                    Rectangle {
                        width: 30
                        height: 30
                        radius: width / 2
                        color: iconColor
                        
                        Text {
                            anchors.centerIn: parent
                            text: symbol[0]
                            color: "white"
                            font.bold: true
                        }
                    }
                    
                    Text {
                        text: name
                        color: textColor
                        font.bold: isActive
                        Layout.fillWidth: true
                    }
                }
            }
        }
        
        PlasmaComponents.Button {
            text: "Manage Networks"
            icon.name: "configure"
            Layout.fillWidth: true
            onClicked: {
                networkSelector.visible = false;
                navList.currentIndex = 5; // Switch to Networks view
            }
        }
    }
}
