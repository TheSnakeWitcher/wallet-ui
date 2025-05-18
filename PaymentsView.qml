import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtGraphicalEffects 1.15

Item {
    id: paymentsView
    anchors.fill: parent
    visible: navList.currentIndex === 1 // Show when "Contracts" is selected in navigation

    // Color scheme based on KDE Breeze
    property color accentColor: "#3daee9"
    property color bgColor: "#232629"
    property color cardBgColor: "#31363b"
    property color textColor: "#eff0f1"
    property color secondaryTextColor: "#bdc3c7"
    property color positiveColor: "#27ae60"
    property color negativeColor: "#da4453"
    property color dividerColor: "#3f4347"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // Main content - Split into left (contract list) and right (contract details)
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 20

            // Left side - Bill list
            Rectangle {
                // Layout.preferredWidth: parent.width * 0.38
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 12
                color: cardBgColor

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 0

                    // Header
                    RowLayout {
                        Layout.fillWidth: true
                        height: 40
                        spacing: 10

                        PlasmaExtras.Heading {
                            text: "Bills"
                            level: 4
                            color: textColor
                        }

                        Item { Layout.fillWidth: true }

                        // Filter button
                        PlasmaComponents.Button {
                            text: "Filter"
                            icon.name: "view-filter"
                            Layout.preferredWidth: 100
                        }

                        // Create bill
                        PlasmaComponents.Button {
                            text: "Create bill"
                            icon.name: "list-add"
                        }
                    }

                    // Contract type tabs
                    TabBar {
                        id: contractTypeTabs
                        Layout.fillWidth: true
                        Layout.preferredHeight: 40
                        position: TabBar.Header
                        
                        background: Rectangle {
                            color: "transparent"
                        }

                        TabButton {
                            text: "All"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }

                        TabButton {
                            text: "Draft"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }
                        
                        TabButton {
                            text: "Pending to approve"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }

                        TabButton {
                            text: "Pending to pay"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }
                        
                        TabButton {
                            text: "Paid"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }
                        
                    }

                    // Divider
                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: dividerColor
                    }

                    // Contracts list
                    ListView {
                        id: contractsList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: paymentsModel
                        currentIndex: 0
                        
                        delegate: Rectangle {
                            width: contractsList.width
                            height: 70
                            color: contractsList.currentIndex === index ? Qt.lighter(cardBgColor, 1.2) : cardBgColor
                            
                            Rectangle {
                                width: 4
                                height: parent.height
                                color: contractsList.currentIndex === index ? accentColor : "transparent"
                                anchors.left: parent.left
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: contractsList.currentIndex = index
                                hoverEnabled: true
                                
                                Rectangle {
                                    anchors.fill: parent
                                    color: parent.containsMouse && contractsList.currentIndex !== index ? 
                                          Qt.lighter(cardBgColor, 1.1) : "transparent"
                                }
                            }
                            
                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 15
                                anchors.rightMargin:.15
                                spacing: 12
                                
                                // Contract icon/type indicator
                                Rectangle {
                                    width: 40
                                    height: 40
                                    radius: 8
                                    color: model.iconColor
                                    
                                    Text {
                                        anchors.centerIn: parent
                                        text: model.iconText
                                        color: "white"
                                        font.bold: true
                                    }
                                }
                                
                                // Contract details
                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 4
                                    
                                    Text {
                                        text: model.name
                                        color: textColor
                                        font.bold: true
                                        font.pixelSize: 14
                                    }
                                    
                                    Text {
                                        text: model.address
                                        color: secondaryTextColor
                                        font.pixelSize: 12
                                        elide: Text.ElideMiddle
                                    }
                                    
                                    RowLayout {
                                        spacing: 6
                                        
                                        Rectangle {
                                            width: 10
                                            height: 10
                                            radius: width / 2
                                            color: model.networkColor
                                        }
                                        
                                        Text {
                                            text: model.network
                                            color: secondaryTextColor
                                            font.pixelSize: 11
                                        }
                                        
                                        Rectangle {
                                            width: 4
                                            height: 4
                                            radius: width / 2
                                            color: secondaryTextColor
                                        }
                                        
                                        Text {
                                            text: model.type
                                            color: secondaryTextColor
                                            font.pixelSize: 11
                                        }
                                    }
                                }
                            }
                            
                            // Bottom divider
                            Rectangle {
                                width: parent.width
                                height: 1
                                color: dividerColor
                                anchors.bottom: parent.bottom
                            }
                        }
                    }
                }
            }

            // Right side - Invoice list
            Rectangle {
                // Layout.preferredWidth: parent.width * 0.38
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 12
                color: cardBgColor

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 0

                    // Header
                    RowLayout {
                        Layout.fillWidth: true
                        height: 40
                        spacing: 10

                        PlasmaExtras.Heading {
                            text: "Invoices"
                            level: 4
                            color: textColor
                        }

                        Item { Layout.fillWidth: true }

                        // Filter button
                        PlasmaComponents.Button {
                            text: "Filter"
                            icon.name: "view-filter"
                            Layout.preferredWidth: 100
                        }

                        // Create Invoice
                        PlasmaComponents.Button {
                            text: "Create Invoice"
                            icon.name: "list-add"
                        }

                    }

                    // Contract type tabs
                    TabBar {
                        id: invoiceTypeTabs
                        Layout.fillWidth: true
                        Layout.preferredHeight: 40
                        position: TabBar.Header
                        
                        background: Rectangle {
                            color: "transparent"
                        }

                        TabButton {
                            text: "All"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }

                        TabButton {
                            text: "Draft"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }
                        
                        TabButton {
                            text: "Unpaid"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }
                        
                        TabButton {
                            text: "Paid"
                            width: implicitWidth
                            height: 36
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.checked ? accentColor : secondaryTextColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    width: parent.width
                                    height: 3
                                    anchors.bottom: parent.bottom
                                    color: parent.checked ? accentColor : "transparent"
                                    radius: 1.5
                                }
                            }
                        }
                        
                    }

                    // Divider
                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: dividerColor
                    }

                    // Contracts list
                    ListView {
                        id: invoiceList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: paymentsModel
                        currentIndex: 0
                        
                        delegate: Rectangle {
                            width: invoiceList.width
                            height: 70
                            color: invoiceList.currentIndex === index ? Qt.lighter(cardBgColor, 1.2) : cardBgColor
                            
                            Rectangle {
                                width: 4
                                height: parent.height
                                color: invoiceList.currentIndex === index ? accentColor : "transparent"
                                anchors.left: parent.left
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: invoiceList.currentIndex = index
                                hoverEnabled: true
                                
                                Rectangle {
                                    anchors.fill: parent
                                    color: parent.containsMouse && invoiceList.currentIndex !== index ? 
                                          Qt.lighter(cardBgColor, 1.1) : "transparent"
                                }
                            }
                            
                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 15
                                anchors.rightMargin:.15
                                spacing: 12
                                
                                // Contract icon/type indicator
                                Rectangle {
                                    width: 40
                                    height: 40
                                    radius: 8
                                    color: model.iconColor
                                    
                                    Text {
                                        anchors.centerIn: parent
                                        text: model.iconText
                                        color: "white"
                                        font.bold: true
                                    }
                                }
                                
                                // Contract details
                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 4
                                    
                                    Text {
                                        text: model.name
                                        color: textColor
                                        font.bold: true
                                        font.pixelSize: 14
                                    }
                                    
                                    Text {
                                        text: model.address
                                        color: secondaryTextColor
                                        font.pixelSize: 12
                                        elide: Text.ElideMiddle
                                    }
                                    
                                    RowLayout {
                                        spacing: 6
                                        
                                        Rectangle {
                                            width: 10
                                            height: 10
                                            radius: width / 2
                                            color: model.networkColor
                                        }
                                        
                                        Text {
                                            text: model.network
                                            color: secondaryTextColor
                                            font.pixelSize: 11
                                        }
                                        
                                        Rectangle {
                                            width: 4
                                            height: 4
                                            radius: width / 2
                                            color: secondaryTextColor
                                        }
                                        
                                        Text {
                                            text: model.type
                                            color: secondaryTextColor
                                            font.pixelSize: 11
                                        }
                                    }
                                }
                            }
                            
                            // Bottom divider
                            Rectangle {
                                width: parent.width
                                height: 1
                                color: dividerColor
                                anchors.bottom: parent.bottom
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Model for contract list
    ListModel {
        id: paymentsModel

	    // customer: "Alex"
	    // amount: "100"
	    // method: "USDT POL"
	    // // asset: "USDT"
	    // // network: "POLYGON"
	    // dueDate: "Jun 1, 2025"
	    // invoice: 000001
	    // product: "Product1"
        
        ListElement {
            name: "PoolByPair"
            address: "0x411...3A28"
            network: "Polygon"
            networkColor: "#8247E5"
            type: "Custom"
            iconText: "P"
            iconColor: "#8247E5"
        }
        
        ListElement {
            name: "USDC Token"
            address: "0x2791...4A12"
            network: "Ethereum"
            networkColor: "#627eea"
            type: "ERC20"
            iconText: "T"
            iconColor: "#1969FF"
        }
        
        ListElement {
            name: "Farming Contract"
            address: "0x7F2...1E78"
            network: "Polygon"
            networkColor: "#8247E5"
            type: "Custom"
            iconText: "F"
            iconColor: "#00FFA3"
        }
        
        ListElement {
            name: "NFT Collection"
            address: "0xF39...2B76"
            network: "Arbitrum"
            networkColor: "#28A0F0"
            type: "ERC721"
            iconText: "N"
            iconColor: "#E84142"
        }
        
        ListElement {
            name: "Vault Contract"
            address: "0x36E...5C80"
            network: "Polygon"
            networkColor: "#8247E5"
            type: "Custom"
            iconText: "V"
            iconColor: "#8A2BE2"
        }
        
        ListElement {
            name: "Deployer Contract"
            address: "0x2D9...CB92"
            network: "Polygon"
            networkColor: "#8247E5"
            type: "Custom"
            iconText: "D"
            iconColor: "#E84142"
        }
    }
}
