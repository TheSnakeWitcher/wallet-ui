import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtGraphicalEffects 1.15
import QtQml 2.15

ColumnLayout {
    anchors.fill: parent
    anchors.margins: 20
    spacing: 20
    visible: navList.currentIndex === 3
    
    // Header with network selection
    RowLayout {
        Layout.fillWidth: true
        
        PlasmaExtras.Heading {
            text: "Networks"
            level: 2
            color: textColor
        }
        
        Item { Layout.fillWidth: true }

        PlasmaComponents.Button {
            text: "Add Network"
            icon.name: "list-add"
        }
    }
    
    // Network Management area
    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 20
        
        // Networks list
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 2
            Layout.maximumWidth: parent.width / 2
            radius: 12
            color: cardBgColor
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15
                
                PlasmaComponents.TextField {
                    Layout.fillWidth: true
                    placeholderText: "Search networks"
                    background: Rectangle {
                        color: Qt.darker(cardBgColor, 1.1)
                        radius: 6
                    }
                }
                
                // Networks list
                ListView {
                    id: networksList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 8
                    
                    model: ListModel {
                        id: networksModel
                        
                        ListElement {
                            name: "Ethereum Mainnet"
                            rpcUrl: "https://mainnet.infura.io/v3/your-api-key"
                            chainId: "1"
                            symbol: "ETH"
                            blockExplorer: "https://etherscan.io"
                            iconColor: "#627eea"
                            isActive: true
                        }
                        
                        ListElement {
                            name: "Binance Smart Chain"
                            rpcUrl: "https://bsc-dataseed.binance.org"
                            chainId: "56"
                            symbol: "BNB"
                            blockExplorer: "https://bscscan.com"
                            iconColor: "#F0B90B"
                            isActive: false
                        }
                        
                        ListElement {
                            name: "Polygon"
                            rpcUrl: "https://polygon-rpc.com"
                            chainId: "137"
                            symbol: "MATIC"
                            blockExplorer: "https://polygonscan.com"
                            iconColor: "#8247E5"
                            isActive: false
                        }
                        
                        ListElement {
                            name: "Arbitrum One"
                            rpcUrl: "https://arb1.arbitrum.io/rpc"
                            chainId: "42161"
                            symbol: "ETH"
                            blockExplorer: "https://arbiscan.io"
                            iconColor: "#28A0F0"
                            isActive: false
                        }
                        
                        ListElement {
                            name: "Optimism"
                            rpcUrl: "https://mainnet.optimism.io"
                            chainId: "10"
                            symbol: "ETH"
                            blockExplorer: "https://optimistic.etherscan.io"
                            iconColor: "#FF0420"
                            isActive: false
                        }
                        
                        ListElement {
                            name: "Avalanche C-Chain"
                            rpcUrl: "https://api.avax.network/ext/bc/C/rpc"
                            chainId: "43114"
                            symbol: "AVAX"
                            blockExplorer: "https://snowtrace.io"
                            iconColor: "#E84142"
                            isActive: false
                        }
                        
                        ListElement {
                            name: "Fantom Opera"
                            rpcUrl: "https://rpc.ftm.tools"
                            chainId: "250"
                            symbol: "FTM"
                            blockExplorer: "https://ftmscan.com"
                            iconColor: "#1969FF"
                            isActive: false
                        }
                        
                        ListElement {
                            name: "Solana"
                            rpcUrl: "https://api.mainnet-beta.solana.com"
                            chainId: "N/A"
                            symbol: "SOL"
                            blockExplorer: "https://explorer.solana.com"
                            iconColor: "#00FFA3"
                            isActive: false
                        }
                    }
                    
                    delegate: Rectangle {
                        width: networksList.width
                        height: 70
                        radius: 8
                        color: isActive ? Qt.lighter(cardBgColor, 1.3) : Qt.darker(cardBgColor, 1.1)
                        border.width: isActive ? 2 : 0
                        border.color: isActive ? accentColor : "transparent"
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // Deactivate all networks
                                for (let i = 0; i < networksModel.count; i++) {
                                    networksModel.setProperty(i, "isActive", false);
                                }
                                // Activate this network
                                networksModel.setProperty(index, "isActive", true);
                                // Update the app-wide current network
                                currentNetwork = name;
                                currentNetworkColor = iconColor;
                                
                                // Show details in the right panel
                                networkDetailsName.text = name;
                                networkDetailsRPC.text = rpcUrl;
                                networkDetailsChainId.text = chainId;
                                networkDetailsSymbol.text = symbol;
                                networkDetailsExplorer.text = blockExplorer;
                                networkDetailsColor = iconColor;
                            }
                        }
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 12
                            
                            // Network status indicator
                            Rectangle {
                                width: 12
                                height: 12
                                radius: width / 2
                                color: isActive ? positiveColor : "transparent"
                                border.width: isActive ? 0 : 1
                                border.color: isActive ? "transparent" : dividerColor
                            }
                            
                            // Network icon
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
                            
                            // Network details
                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 4
                                
                                Text {
                                    text: name
                                    color: textColor
                                    font.bold: true
                                }
                                
                                Text {
                                    text: "Chain ID: " + chainId + " • " + symbol
                                    color: secondaryTextColor
                                    font.pixelSize: 12
                                    elide: Text.ElideRight
                                }
                            }
                            
                            // Action buttons
                            Row {
                                spacing: 6
                                
                                PlasmaComponents.ToolButton {
                                    icon.name: "document-edit"
                                    display: PlasmaComponents.Button.IconOnly
                                    ToolTip.text: "Edit"
                                    ToolTip.visible: hovered
                                }
                                
                                PlasmaComponents.ToolButton {
                                    icon.name: "edit-delete"
                                    display: PlasmaComponents.Button.IconOnly
                                    ToolTip.text: "Delete"
                                    ToolTip.visible: hovered
                                    visible: !isActive // Can't delete active network
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // Network details panel
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 12
            color: cardBgColor
            
            property string selectedNetworkName: "Ethereum Mainnet"
            property color networkDetailsColor: "#627eea"
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 20
                
                // Header with network icon
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 15
                    
                    Rectangle {
                        width: 48
                        height: 48
                        radius: width / 2
                        color: parent.parent.parent.networkDetailsColor
                        
                        Text {
                            id: networkDetailsSymbol
                            anchors.centerIn: parent
                            text: "E"
                            color: "white"
                            font.bold: true
                            font.pixelSize: 20
                        }
                    }
                    
                    PlasmaExtras.Heading {
                        id: networkDetailsName
                        text: "Ethereum Mainnet"
                        level: 3
                        color: textColor
                    }
                    
                    Item { Layout.fillWidth: true }
                    
                    PlasmaComponents.Button {
                        text: "Use Network"
                        icon.name: "dialog-ok-apply"
                        Layout.alignment: Qt.AlignRight
                    }
                }
                
                // Network details form
                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    rowSpacing: 15
                    columnSpacing: 20
                    
                    // Network Name
                    Text {
                        text: "Network Name"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        id: networkDetailsNameField
                        Layout.fillWidth: true
                        text: "Ethereum Mainnet"
                        readOnly: true
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // RPC URL
                    Text {
                        text: "RPC URL"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        id: networkDetailsRPC
                        Layout.fillWidth: true
                        text: "https://mainnet.infura.io/v3/your-api-key"
                        readOnly: true
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // Chain ID
                    Text {
                        text: "Chain ID"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        id: networkDetailsChainId
                        Layout.fillWidth: true
                        text: "1"
                        readOnly: true
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // Currency Symbol
                    Text {
                        text: "Currency Symbol"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        Layout.fillWidth: true
                        text: "ETH"
                        readOnly: true
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // Block Explorer
                    Text {
                        text: "Block Explorer"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        id: networkDetailsExplorer
                        Layout.fillWidth: true
                        text: "https://etherscan.io"
                        readOnly: true
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                }
                
                Item { Layout.fillHeight: true }
                
                // Edit mode buttons
                RowLayout {
                    Layout.fillWidth: true
                    
                    Item { Layout.fillWidth: true }
                    
                    PlasmaComponents.Button {
                        text: "Edit Network"
                        icon.name: "document-edit"
                    }
                    
                    PlasmaComponents.Button {
                        text: "Test Connection"
                        icon.name: "network-connect"
                    }
                }
                
                // Network status
                Rectangle {
                    Layout.fillWidth: true
                    height: 50
                    radius: 8
                    color: positiveColor
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10
                        
                        PlasmaCore.IconItem {
                            source: "dialog-ok"
                            width: 24
                            height: 24
                            colorGroup: PlasmaCore.Theme.ComplementaryColorGroup
                        }
                        
                        Text {
                            text: "Network is active and connected (Last block: #18792348)"
                            color: "white"
                            font.bold: true
                            Layout.fillWidth: true
                        }
                    }
                }
            }
        }
    }
}
