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
        spacing: 0
        
        RowLayout {
            Layout.fillWidth: true
            
            Text {
                text: "Assets"
                color: textColor
                font.pixelSize: 18
                font.bold: true
            }
            
            Item { Layout.preferredWidth: 10 }
            
            RowLayout {
                Text {
                    text: "$12,854.32"
                    color: textColor
                    font.pixelSize: 18
                    font.bold: true
                }
                
                Rectangle {
                    height: 24
                    width: 80
                    radius: 12
                    color: positiveColor
                    
                    Text {
                        anchors.centerIn: parent
                        text: "+5.24%"
                        color: "white"
                        font.bold: true
                    }
                }
            }
            
            Item { Layout.fillWidth: true }
            
            PlasmaComponents.TextField {
                Layout.preferredWidth: 150
                placeholderText: "Search assets"
                background: Rectangle {
                    color: Qt.darker(cardBgColor, 1.1)
                    radius: 6
                }
            }
            
            PlasmaComponents.ToolButton {
                icon.name: "view-sort"
                text: "Sort"
                display: PlasmaComponents.Button.TextBesideIcon
            }
        }
        
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            
            ListView {
                id: portfolioList
                anchors.fill: parent
                spacing: 0
                
                // Asset model with proper parent-child relationships
                model: ListModel {
                    id: assetModel
                    
                    // Bitcoin parent
                    ListElement {
                        name: "Bitcoin"
                        symbol: "BTC"
                        totalAmount: "4.3281"
                        totalValue: "$8,245.92"
                        change: "+4.32%"
                        iconColor: "#f7931a"
                        isParent: true
                        isExpanded: false
                    }
                    
                    // Ethereum parent
                    ListElement {
                        name: "Ethereum"
                        symbol: "ETH"
                        totalAmount: "15.4321"
                        totalValue: "$3,842.11"
                        change: "+2.14%"
                        iconColor: "#627eea"
                        isParent: true
                        isExpanded: true
                    }
                    
                    // USDT parent
                    ListElement {
                        name: "USDT"
                        symbol: "USDT"
                        totalAmount: "2,500.0000"
                        totalValue: "$2,500.00"
                        change: "+0.02%"
                        iconColor: "#26a17b"
                        isParent: true
                        isExpanded: true
                        childId: "usdt"
                    }
                    
                    // WBTC parent
                    ListElement {
                        name: "WBTC"
                        symbol: "WBTC"
                        totalAmount: "230.0000"
                        totalValue: "$460.00"
                        change: "+12.54%"
                        iconColor: "#1d99f3"
                        isParent: true
                        isExpanded: false
                        childId: "wbtc"
                    }
                    
                    // TON parent
                    ListElement {
                        name: "TON"
                        symbol: "TON"
                        totalAmount: "150.0000"
                        totalValue: "$324.50"
                        change: "+8.76%"
                        iconColor: "#0088cc"
                        isParent: true
                        isExpanded: true
                        childId: "ton"
                    }
                    
                    // Litecoin parent
                    ListElement {
                        name: "Litecoin"
                        symbol: "LTC"
                        totalAmount: "12.0000"
                        totalValue: "$625.20"
                        change: "-0.34%"
                        iconColor: "#bfbbbb"
                        isParent: true
                        isExpanded: true
                        childId: "ltc"
                    }
                    
                    // USDC parent
                    ListElement {
                        name: "USDC"
                        symbol: "USDC"
                        totalAmount: "1,800.0000"
                        totalValue: "$1,800.00"
                        change: "+0.01%"
                        iconColor: "#2775ca"
                        isParent: true
                        isExpanded: true
                        childId: "usdc"
                    }
                    
                    // Simple assets without children
                    ListElement {
                        name: "Solana"
                        symbol: "SOL"
                        totalAmount: "45.1200"
                        totalValue: "$205.45"
                        change: "-1.23%"
                        iconColor: "#00ffa3"
                        isParent: true
                        isExpanded: false
                        childId: ""
                    }
                    
                    ListElement {
                        name: "Polkadot"
                        symbol: "DOT"
                        totalAmount: "120.0000"
                        totalValue: "$100.84"
                        change: "+0.84%"
                        iconColor: "#e6007a"
                        isParent: true
                        isExpanded: false
                        childId: ""
                    }
                    
                    ListElement {
                        name: "WETH"
                        symbol: "WETH"
                        totalAmount: "0.5000"
                        totalValue: "$124.65"
                        change: "+0.84%"
                        iconColor: "#a3009a"
                        isParent: true
                        isExpanded: false
                        childId: ""
                    }
                }
                
                // Child models stored separately for each parent
                property var childModels: {
                    "usdt": [
                        { name: "Polygon", symbol: "USDT", totalAmount: "1,000.0000", totalValue: "$1,000.00", iconColor: "#26a17b" },
                        { name: "BSC", symbol: "USDT", totalAmount: "1,000.0000", totalValue: "$1,000.00", iconColor: "#26a17b" },
                        { name: "Tron", symbol: "USDT", totalAmount: "500.0000", totalValue: "$500.00", iconColor: "#26a17b" }
                    ],
                    "usdc": [
                        { name: "Ethereum", symbol: "USDC", totalAmount: "800.0000", totalValue: "$800.00", iconColor: "#2775ca" },
                        { name: "Polygon", symbol: "USDC", totalAmount: "500.0000", totalValue: "$500.00", iconColor: "#2775ca" },
                        { name: "Solana", symbol: "USDC", totalAmount: "500.0000", totalValue: "$500.00", iconColor: "#2775ca" }
                    ]
                }
                
                // Delegate for each asset item
                delegate: Column {
                    width: portfolioList.width
                    
                    // Parent asset item
                    Rectangle {
                        id: assetItem
                        width: portfolioList.width
                        height: 70
                        anchors.topMargin: 5
                        anchors.bottomMargin: 5
                        radius: 8
                        color: Qt.darker(cardBgColor, 1.1)
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 12
                            
                            // Coin icon
                            Rectangle {
                                width: 38
                                height: 38
                                radius: width / 2
                                color: iconColor
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: symbol[0]
                                    color: "white"
                                    font.bold: true
                                }
                            }
                            
                            // Asset details
                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 4
                                
                                RowLayout {
                                    spacing: 6
                                    Layout.fillWidth: true
                                    
                                    Text {
                                        text: name
                                        color: textColor
                                        font.bold: true
                                        Layout.preferredWidth: 150
                                    }
                                    
                                    Text {
                                        text: symbol
                                        color: secondaryTextColor
                                        font.pixelSize: 12
                                        Layout.preferredWidth: 50
                                    }
                                    
                                    // Expand/collapse arrow for parent items
                                    PlasmaComponents.ToolButton {
                                        visible: childId !== ""
                                        icon.name: isExpanded ? "arrow-down" : "arrow-right"
                                        width: 24
                                        height: 24
                                        onClicked: {
                                            assetModel.setProperty(index, "isExpanded", !isExpanded);
                                        }
                                    }
                                }
                                
                                Text {
                                    text: totalAmount + " " + symbol
                                    color: secondaryTextColor
                                    font.pixelSize: 12
                                }
                            }
                            
                            // Value information 
                            ColumnLayout {
                                spacing: 4
                                Layout.minimumWidth: 100
                                Layout.alignment: Qt.AlignRight
                                
                                Text {
                                    text: totalValue
                                    color: textColor
                                    font.bold: true
                                    Layout.alignment: Qt.AlignRight
                                }
                                
                                Text {
                                    text: change
                                    color: change.indexOf("+") === 0 ? positiveColor : 
                                           change.indexOf("-") === 0 ? negativeColor : secondaryTextColor
                                    font.pixelSize: 12
                                    Layout.alignment: Qt.AlignRight
                                }
                            }
                            
                            // Action buttons row
                            Row {
                                spacing: 6
                                
                                PlasmaComponents.ToolButton {
                                    icon.name: "arrow-up"
                                    text: "Send"
                                    display: PlasmaComponents.Button.IconOnly
                                    ToolTip.text: "Send"
                                    ToolTip.visible: hovered
                                }
                                
                                PlasmaComponents.ToolButton {
                                    icon.name: "arrow-down"
                                    text: "Receive"
                                    display: PlasmaComponents.Button.IconOnly
                                    ToolTip.text: "Receive"
                                    ToolTip.visible: hovered
                                }
                                
                                PlasmaComponents.ToolButton {
                                    icon.name: "exchange-positions"
                                    text: "Swap"
                                    display: PlasmaComponents.Button.IconOnly
                                    ToolTip.text: "Swap"
                                    ToolTip.visible: hovered
                                }
                                
                                PlasmaComponents.ToolButton {
                                    icon.name: "go-next"
                                    text: "Transfer"
                                    display: PlasmaComponents.Button.IconOnly
                                    ToolTip.text: "Transfer Between Chains"
                                    ToolTip.visible: hovered
                                    visible: childId !== ""
                                }
                            }
                        }
                    }
                    
                    // Child assets section (networks)
                    Column {
                        id: childAssetsColumn
                        width: parent.width
                        visible: isExpanded && childId !== ""
                        property var childData: childId !== "" ? portfolioList.childModels[childId] : []
                        
                        // Generate child items dynamically
                        Repeater {
                            model: childAssetsColumn.childData
                            
                            Rectangle {
                                width: portfolioList.width
                                height: 65
                                radius: 8
                                color: Qt.darker(cardBgColor, 1.1)
                                anchors.leftMargin: 40
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 12
                                    anchors.leftMargin: 50 // Indent child items
                                    spacing: 12
                                    
                                    // Network icon
                                    Rectangle {
                                        width: 38
                                        height: 38
                                        radius: width / 2
                                        color: modelData.iconColor
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            text: modelData.symbol[0]
                                            color: "white"
                                            font.bold: true
                                        }
                                    }
                                    
                                    // Network details
                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 4
                                        
                                        Text {
                                            text: modelData.name
                                            color: textColor
                                            font.bold: true
                                        }
                                        
                                        Text {
                                            text: modelData.totalAmount
                                            color: secondaryTextColor
                                            font.pixelSize: 12
                                        }
                                    }
                                    
                                    // Value information
                                    Text {
                                        text: modelData.totalValue
                                        color: textColor
                                        font.bold: true
                                        Layout.alignment: Qt.AlignRight
                                    }
                                    
                                    // Action buttons for child items
                                    Row {
                                        spacing: 6
                                        
                                        PlasmaComponents.ToolButton {
                                            icon.name: "arrow-up"
                                            text: "Send"
                                            display: PlasmaComponents.Button.IconOnly
                                            ToolTip.text: "Send"
                                            ToolTip.visible: hovered
                                        }
                                        
                                        PlasmaComponents.ToolButton {
                                            icon.name: "arrow-down"
                                            text: "Receive"
                                            display: PlasmaComponents.Button.IconOnly
                                            ToolTip.text: "Receive"
                                            ToolTip.visible: hovered
                                        }
                                        
                                        PlasmaComponents.ToolButton {
                                            icon.name: "exchange-positions"
                                            text: "Swap"
                                            display: PlasmaComponents.Button.IconOnly
                                            ToolTip.text: "Swap"
                                            ToolTip.visible: hovered
                                        }
                                        
                                        PlasmaComponents.ToolButton {
                                            icon.name: "go-next"
                                            text: "Transfer"
                                            display: PlasmaComponents.Button.IconOnly
                                            ToolTip.text: "Transfer Between Chains"
                                            ToolTip.visible: hovered
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    // Divider line
                    Rectangle {
                        width: parent.width
                        height: 1
                        color: dividerColor
                    }
                }
            }
        }
    }
}
