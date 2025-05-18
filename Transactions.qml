import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtGraphicalEffects 1.15
import QtQml 2.15


Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true
    radius: 12
    color: cardBgColor
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10
        
        RowLayout {
            Text {
                text: "Transactions"
                color: textColor
                font.pixelSize: 18
                font.bold: true
            }
            
            Item { Layout.fillWidth: true }
            
            PlasmaComponents.Button {
                flat: true
                text: "View All"
                icon.name: "go-next"
            }
        }
        
        ListView {
            id: transactionsList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 8
            model: ListModel {
                ListElement { type: "send"; address: "0x82...F412"; amount: "-0.5 BTC"; value: "-$949.32"; time: "Today, 14:32" }
                ListElement { type: "receive"; address: "0x3A...B291"; amount: "+25 KDE"; value: "+$50.00"; time: "Yesterday, 09:21" }
                ListElement { type: "swap"; address: "ETH → BTC"; amount: "1.2 ETH"; value: "+$224.64"; time: "Apr 20, 18:45" }
                ListElement { type: "transfer"; address: "Polygon → BSC"; amount: "500 USDT"; value: "-$2.15 (fee)"; time: "Apr 20, 16:30" }
                ListElement { type: "receive"; address: "0x6D...A932"; amount: "+2.1 ETH"; value: "+$524.37"; time: "Apr 19, 11:30" }
                ListElement { type: "transfer"; address: "ETH → Arbitrum"; amount: "1.5 ETH"; value: "-$3.42 (fee)"; time: "Apr 19, 10:22" }
                ListElement { type: "send"; address: "0x45...B721"; amount: "-10 KDE"; value: "-$20.00"; time: "Apr 18, 10:15" }
                ListElement { type: "transfer"; address: "BSC → Tron"; amount: "200 USDT"; value: "-$0.35 (fee)"; time: "Apr 18, 09:47" }
                ListElement { type: "swap"; address: "SOL → ETH"; amount: "5 SOL"; value: "+$22.75"; time: "Apr 17, 16:22" }
            }
            
            delegate: Rectangle {
                width: transactionsList.width
                height: 70
                radius: 8
                color: Qt.darker(cardBgColor, 1.1)
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 12
                    
                    Rectangle {
                        width: 40
                        height: 40
                        radius: width / 2
                        color: {
                            if (type === "send") return negativeColor
                            else if (type === "receive") return positiveColor
                            else if (type === "transfer") return "#9b59b6"
                            else return accentColor
                        }
                        
                        Text {
                            anchors.centerIn: parent
                            text: {
                                if (type === "send") return "↑"
                                else if (type === "receive") return "↓"
                                else if (type === "transfer") return "→"
                                else return "⇄"
                            }
                            color: "white"
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4
                        
                        Text {
                            text: {
                                if (type === "send") return "Sent to"
                                else if (type === "receive") return "Received from"
                                else if (type === "transfer") return "Transferred"
                                else return "Swapped"
                            }
                            color: secondaryTextColor
                            font.pixelSize: 12
                        }
                        
                        Text {
                            text: address
                            color: textColor
                            font.bold: true
                            elide: Text.ElideMiddle
                        }
                    }
                    
                    ColumnLayout {
                        spacing: 4
                        Layout.alignment: Qt.AlignRight
                        
                        Text {
                            text: amount
                            color: {
                                if (amount.indexOf("-") === 0) return negativeColor
                                else if (amount.indexOf("+") === 0) return positiveColor
                                else return textColor
                            }
                            font.bold: true
                            Layout.alignment: Qt.AlignRight
                        }
                        
                        Text {
                            text: value
                            color: {
                                if (value.indexOf("-") === 0) return negativeColor
                                else if (value.indexOf("+") === 0) return positiveColor
                                else return secondaryTextColor
                            }
                            font.pixelSize: 12
                            Layout.alignment: Qt.AlignRight
                        }
                    }
                    
                    Text {
                        text: time
                        color: secondaryTextColor
                        font.pixelSize: 12
                        Layout.preferredWidth: 100
                        Layout.alignment: Qt.AlignRight
                    }
                }
            }
        }
    }
}
