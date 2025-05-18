import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtGraphicalEffects 1.15
import QtQml 2.15

ApplicationWindow {
    id: mainWindow
    title: "Portal"
    width: 1000
    height: 700
    visible: true
    
    // Color scheme based on KDE Breeze
    property color accentColor: "#3daee9"
    property color bgColor: "#232629"
    property color cardBgColor: "#31363b"
    property color textColor: "#eff0f1"
    property color secondaryTextColor: "#bdc3c7"
    property color positiveColor: "#27ae60"
    property color negativeColor: "#da4453"
    property color dividerColor: "#3f4347"
    
    // Current active network
    property string currentNetwork: "Ethereum Mainnet"
    property color currentNetworkColor: "#627eea"
    
    color: bgColor
    
    // Left sidebar with navigation
    Rectangle {
        id: sidebar
        width: 200
        color: cardBgColor
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        
        ColumnLayout {
            anchors.fill: parent
            spacing: 12
            
            // Profile section with network indicator
            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                height: 80 // Increased height to accommodate network info
                radius: 8
                color: Qt.darker(cardBgColor, 1.1)
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 4
                    
                    RowLayout {
                        Layout.fillWidth: true
                        
                        Rectangle {
                            width: 44
                            height: 44
                            radius: width / 2
                            color: accentColor
                            
                            Text {
                                anchors.centerIn: parent
                                text: "PS"
                                color: "white"
                                font.bold: true
                            }
                        }
                        
                        Column {
                            Layout.fillWidth: true
                            spacing: 4
                            
                            Text {
                                text: "Main"
                                color: textColor
                                font.bold: true
                            }
                            
                            Text {
                                text: "0xF3...8A21"
                                color: secondaryTextColor
                                font.pixelSize: 12
                            }
                        }
                    }
                    
                    // Network indicator
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.leftMargin: 52 // Align with wallet text
                        height: 20
                        radius: 4
                        color: Qt.darker(cardBgColor, 1.3)
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 2
                            spacing: 4
                            
                            Rectangle {
                                width: 8
                                height: 8
                                radius: width / 2
                                color: currentNetworkColor
                            }
                            
                            Text {
                                text: currentNetwork
                                color: secondaryTextColor
                                font.pixelSize: 10
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                            }
                        }
                    }
                }
            }
            
            // Navigation
            ListView {
                id: navList
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.topMargin: 20
                model: ["Dashboard", "Payments", "Contracts", "Networks", "Plugins", "Settings"]
                currentIndex: 0
                delegate: Item {
                    width: navList.width
                    height: 44
                    
                    Rectangle {
                        width: parent.width - 20
                        height: 36
                        anchors.centerIn: parent
                        radius: 6
                        color: navList.currentIndex === index ? Qt.lighter(cardBgColor, 1.3) : "transparent"
                        
                        MouseArea {
                            anchors.fill: parent
                            onClicked: navList.currentIndex = index
                            hoverEnabled: true
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 6
                                color: parent.containsMouse && navList.currentIndex !== index ? 
                                       Qt.lighter(cardBgColor, 1.1) : "transparent"
                            }
                        }
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 12
                            spacing: 10
                            
                            Rectangle {
                                width: 20
                                height: 20
                                radius: 4
                                color: accentColor
                                visible: navList.currentIndex === index
                            }
                            
                            Text {
                                text: modelData
                                color: navList.currentIndex === index ? accentColor : textColor
                                font.pixelSize: 14
                                font.bold: navList.currentIndex === index
                            }
                        }
                    }
                }
            }
            
            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                Layout.bottomMargin: 20
                height: 40
                radius: 8
                color: "#2980b9"
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 5
                    
                    // Network indicator dot
                    Rectangle {
                        width: 10
                        height: 10
                        radius: width / 2
                        color: currentNetworkColor
                    }
                    
                    Text {
                        Layout.fillWidth: true
                        text: "Connect Wallet"
                        color: "white"
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        // Handle connect
                    }
                }
            }
        }
    }
    
    // Main content area
    Item {
        id: contentArea
        anchors {
            left: sidebar.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        
        // Dashboard content - visible when navList.currentIndex === 0
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 20
            visible: navList.currentIndex === 0
            
            // Top row with centered input and buttons
            Rectangle {
                Layout.fillWidth: true
                height: 180
                radius: 12
                color: cardBgColor
                
                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 15
                    
                    // AI Input section - centered and larger
                    Rectangle {
                        Layout.preferredWidth: 450
                        Layout.preferredHeight: 50
                        color: Qt.darker(cardBgColor, 1.1)
                        radius: 8
                        
                        TextInput {
                            id: aiInput
                            anchors.fill: parent
                            anchors.margins: 12
                            color: textColor
                            font.pixelSize: 16
                            clip: true
                            
                            Text {
                                anchors.fill: parent
                                text: "Enter operation (e.g., 'Send 0.1 BTC to 0x123...')"
                                color: secondaryTextColor
                                font.pixelSize: 16
                                visible: !aiInput.text && !aiInput.activeFocus
                            }
                        }
                    }
                    
                    // Buttons row centered and below input
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 15
                        
                        PlasmaComponents.Button {
                            text: "Send"
                            icon.name: "go-up"
                            Layout.preferredHeight: 40
                            Layout.preferredWidth: 120
                        }
                        
                        PlasmaComponents.Button {
                            text: "Receive"
                            icon.name: "go-down"
                            Layout.preferredHeight: 40
                            Layout.preferredWidth: 120
                        }
                        
                        PlasmaComponents.Button {
                            text: "Move"
                            icon.name: "go-next"
                            Layout.preferredHeight: 40
                            Layout.preferredWidth: 120
                            onClicked: networkSelectorPopupList.open()
                        }

                        PlasmaComponents.Button {
                            text: "Swap"
                            icon.name: "exchange-positions"
                            Layout.preferredHeight: 40
                            Layout.preferredWidth: 120
                            onClicked: swapFormPopup.open()
                        }
                    }
                }
            }
            
            // Assets and transactions row
            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 20
                
                // Assets section (Exodus-style)
                Assets{}
                
                // Transactions section 
                Transactions{}
            }
        }

        PaymentsView {}
        ContractView {}
        NetworkView {}
        PluginsView {}
        
        // Add Network Dialog (would be shown when "Add Network" is clicked)
        Rectangle {
            id: addNetworkDialog
            anchors.centerIn: parent
            width: 500
            height: 550
            radius: 12
            color: cardBgColor
            visible: false // Only visible when adding a network
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15
                
                // Header
                PlasmaExtras.Heading {
                    text: "Add Network"
                    level: 3
                    color: textColor
                    Layout.fillWidth: true
                }
                
                // Form
                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    rowSpacing: 15
                    columnSpacing: 20
                    
                    // Network Name
                    Text {
                        text: "Network Name*"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        Layout.fillWidth: true
                        placeholderText: "e.g., Ethereum Mainnet"
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // RPC URL
                    Text {
                        text: "RPC URL*"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        Layout.fillWidth: true
                        placeholderText: "e.g., https://mainnet.infura.io/v3/"
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // Chain ID
                    Text {
                        text: "Chain ID*"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        Layout.fillWidth: true
                        placeholderText: "e.g., 1"
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // Currency Symbol
                    Text {
                        text: "Currency Symbol*"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        Layout.fillWidth: true
                        placeholderText: "e.g., ETH"
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // Block Explorer
                    Text {
                        text: "Block Explorer URL"
                        color: textColor
                        font.bold: true
                    }
                    
                    PlasmaComponents.TextField {
                        Layout.fillWidth: true
                        placeholderText: "e.g., https://etherscan.io"
                        background: Rectangle {
                            color: Qt.darker(cardBgColor, 1.1)
                            radius: 6
                        }
                    }
                    
                    // Color Picker
                    Text {
                        text: "Network Color"
                        color: textColor
                        font.bold: true
                    }
                    
                    // Simple color selection row
                    RowLayout {
                        spacing: 10
                        
                        Repeater {
                            model: ["#627eea", "#F0B90B", "#8247E5", "#FF0420", "#E84142", "#1969FF", "#00FFA3", "#ff8c00"]
                            
                            Rectangle {
                                width: 30
                                height: 30
                                radius: width / 2
                                color: modelData
                                border.width: 2
                                border.color: "white"
                                
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        // Select this color
                                    }
                                }
                            }
                        }
                    }
                }
                
                Item { Layout.fillHeight: true }
                
                // Buttons row
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10
                    
                    Item { Layout.fillWidth: true }
                    
                    PlasmaComponents.Button {
                        text: "Cancel"
                        icon.name: "dialog-cancel"
                        onClicked: addNetworkDialog.visible = false
                    }
                    
                    PlasmaComponents.Button {
                        text: "Test Connection"
                        icon.name: "network-connect"
                    }
                    
                    PlasmaComponents.Button {
                        text: "Add Network"
                        icon.name: "list-add"
                    }
                }
            }
        }
    }
    
    // Network selector dropdown (this would appear when clicking on the network indicator in the sidebar)
    Networks {}
    NetworkSelector {
        id: networkSelectorPopupList
    }
}
