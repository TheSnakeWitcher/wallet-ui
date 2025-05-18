import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtGraphicalEffects 1.15
import QtQml 2.15

Popup {
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    width: 600
    height: 450
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    contentItem: ListView {
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true
        spacing: 5
        
        model: NetworkList{}
        
        delegate: Rectangle {
            width: networkSelectorPopupList.width
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
}

