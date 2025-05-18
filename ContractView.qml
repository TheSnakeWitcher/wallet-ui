import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtGraphicalEffects 1.15

Item {
    id: contractsView
    anchors.fill: parent
    visible: navList.currentIndex === 2 // Show when "Contracts" is selected in navigation

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

        // Header with search and filters
        Rectangle {
            Layout.fillWidth: true
            height: 70
            radius: 12
            color: cardBgColor

            RowLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 15

                // Search input
                Rectangle {
                    Layout.fillWidth: true
                    height: 40
                    color: Qt.darker(cardBgColor, 1.1)
                    radius: 8

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        Text {
                            text: "🔍"
                            color: secondaryTextColor
                        }

                        TextInput {
                            Layout.fillWidth: true
                            color: textColor
                            font.pixelSize: 14
                            clip: true

                            Text {
                                anchors.fill: parent
                                text: "Contracts address or ENS"
                                color: secondaryTextColor
                                font.pixelSize: 14
                                visible: !parent.text && !parent.activeFocus
                            }
                        }
                    }
                }

                // Network filter
                Rectangle {
                    Layout.preferredWidth: 180
                    height: 40
                    radius: 8
                    color: Qt.darker(cardBgColor, 1.1)

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        Rectangle {
                            width: 10
                            height: 10
                            radius: width / 2
                            color: "#8247E5" // Polygon color
                        }

                        Text {
                            text: "Polygon"
                            color: textColor
                            Layout.fillWidth: true
                        }

                        Text {
                            text: "▼"
                            color: secondaryTextColor
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: networkSelectorPopupList.open()
                    }
                }

                PlasmaComponents.Button {
                    text: "Load Contract"
                    icon.name: "list-add"
                    Layout.preferredWidth: 140
                }
            }
        }

        // Main content - Split into left (contract list) and right (contract details)
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 20

            // Left side - Contract list
            Rectangle {
                Layout.preferredWidth: parent.width * 0.38
                Layout.fillHeight: true
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
                            text: "Contracts"
                            level: 4
                            color: textColor
                        }

                        Item { Layout.fillWidth: true }

                        PlasmaComponents.TextField {
                            Layout.preferredWidth: 150
                            placeholderText: "🔍 Search contracts"
                            background: Rectangle {
                                color: Qt.darker(cardBgColor, 1.1)
                                radius: 6
                            }
                        }

                        // Filter button
                        PlasmaComponents.Button {
                            text: "Filter"
                            icon.name: "view-filter"
                            Layout.preferredWidth: 100
                        }

                        Text {
                            text: "6 total"
                            color: secondaryTextColor
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
                            text: "ERC20"
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
                            text: "ERC721"
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
                            text: "Custom"
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
                        model: contractsModel
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

            // Middle side - Contract details
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 12
                color: cardBgColor

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 20

                    // Contract overview section
                    // Rectangle {
                    //     Layout.fillWidth: true
                    //     height: 140
                    //     radius: 8
                    //     color: Qt.lighter(cardBgColor, 1.1)
                    //
                    //     ColumnLayout {
                    //         anchors.fill: parent
                    //         anchors.margins: 15
                    //         spacing: 10
                    //
                    //         Text {
                    //             text: "Contract Overview"
                    //             color: textColor
                    //             font.bold: true
                    //             font.pixelSize: 16
                    //         }
                    //
                    //         RowLayout {
                    //             Layout.fillWidth: true
                    //             spacing: 10
                    //
                    //             Text {
                    //                 text: "Contract"
                    //                 color: secondaryTextColor
                    //             }
                    //
                    //             Rectangle {
                    //                 width: 28
                    //                 height: 28
                    //                 radius: 6
                    //                 color: "#8247E5" // Polygon color
                    //
                    //                 Text {
                    //                     anchors.centerIn: parent
                    //                     text: "P"
                    //                     color: "white"
                    //                     font.bold: true
                    //                 }
                    //             }
                    //
                    //             Text {
                    //                 text: "0x411...3A28"
                    //                 color: textColor
                    //                 Layout.fillWidth: true
                    //             }
                    //
                    //             Image {
                    //                 source: "qrc:/icons/copy.svg"
                    //                 width: 18
                    //                 height: 18
                    //                 opacity: 0.7
                    //             }
                    //         }
                    //
                    //         RowLayout {
                    //             Layout.fillWidth: true
                    //             spacing: 10
                    //
                    //             Text {
                    //                 text: "Balance:"
                    //                 color: secondaryTextColor
                    //                 Layout.preferredWidth: 80
                    //             }
                    //
                    //             Text {
                    //                 text: "0.0000 POL"
                    //                 color: textColor
                    //             }
                    //         }
                    //
                    //         RowLayout {
                    //             Layout.fillWidth: true
                    //             spacing: 10
                    //
                    //             Text {
                    //                 text: "Network:"
                    //                 color: secondaryTextColor
                    //                 Layout.preferredWidth: 80
                    //             }
                    //
                    //             Text {
                    //                 text: "Polygon"
                    //                 color: "#8247E5" // Polygon color
                    //             }
                    //         }
                    //     }
                    // }

                    // Contract data section
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        radius: 8
                        color: Qt.lighter(cardBgColor, 1.1)

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 15

                            Text {
                                text: "Contract Data"
                                color: textColor
                                font.bold: true
                                font.pixelSize: 16
                            }

                            // Contract data items
                            Flickable {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                contentHeight: contractDataLayout.height
                                clip: true
                                
                                ColumnLayout {
                                    id: contractDataLayout
                                    width: parent.width
                                    spacing: 15
                                    
                                    // vaultAddress
                                    RowLayout {
                                        width: parent.width
                                        spacing: 10
                                        
                                        Text {
                                            text: "vaultAddress"
                                            color: secondaryTextColor
                                            Layout.preferredWidth: 150
                                        }
                                        
                                        Rectangle {
                                            width: 24
                                            height: 24
                                            radius: 4
                                            color: "#8A2BE2" // Purple
                                            
                                            Text {
                                                anchors.centerIn: parent
                                                text: "V"
                                                color: "white"
                                                font.bold: true
                                                font.pixelSize: 12
                                            }
                                        }
                                        
                                        Text {
                                            text: "0x36E...5C80"
                                            color: textColor
                                            Layout.fillWidth: true
                                        }
                                    }
                                    
                                    // poolDeployer
                                    RowLayout {
                                        width: parent.width
                                        spacing: 10
                                        
                                        Text {
                                            text: "poolDeployer"
                                            color: secondaryTextColor
                                            Layout.preferredWidth: 150
                                        }
                                        
                                        Rectangle {
                                            width: 24
                                            height: 24
                                            radius: 4
                                            color: "#E84142" // Red
                                            
                                            Text {
                                                anchors.centerIn: parent
                                                text: "D"
                                                color: "white"
                                                font.bold: true
                                                font.pixelSize: 12
                                            }
                                        }
                                        
                                        Text {
                                            text: "0x2D9...CB92"
                                            color: textColor
                                            Layout.fillWidth: true
                                        }
                                    }
                                    
                                    // owner
                                    RowLayout {
                                        width: parent.width
                                        spacing: 10
                                        
                                        Text {
                                            text: "owner"
                                            color: secondaryTextColor
                                            Layout.preferredWidth: 150
                                        }
                                        
                                        Rectangle {
                                            width: 24
                                            height: 24
                                            radius: 4
                                            color: "#8A2BE2" // Purple
                                            
                                            Text {
                                                anchors.centerIn: parent
                                                text: "O"
                                                color: "white"
                                                font.bold: true
                                                font.pixelSize: 12
                                            }
                                        }
                                        
                                        Text {
                                            text: "0x889...a7B"
                                            color: textColor
                                            Layout.fillWidth: true
                                        }
                                    }
                                    
                                    // farmingAddress
                                    RowLayout {
                                        width: parent.width
                                        spacing: 10
                                        
                                        Text {
                                            text: "farmingAddress"
                                            color: secondaryTextColor
                                            Layout.preferredWidth: 150
                                        }
                                        
                                        Rectangle {
                                            width: 24
                                            height: 24
                                            radius: 4
                                            color: "#00FFA3" // Green
                                            
                                            Text {
                                                anchors.centerIn: parent
                                                text: "F"
                                                color: "white"
                                                font.bold: true
                                                font.pixelSize: 12
                                            }
                                        }
                                        
                                        Text {
                                            text: "0x7F2...1E78"
                                            color: textColor
                                            Layout.fillWidth: true
                                        }
                                    }
                                    
                                    // baseFeeConfiguration
                                    ColumnLayout {
                                        width: parent.width
                                        spacing: 8
                                        
                                        RowLayout {
                                            width: parent.width
                                            spacing: 10
                                            
                                            Text {
                                                text: "baseFeeConfiguration"
                                                color: secondaryTextColor
                                                Layout.preferredWidth: 150
                                            }
                                            
                                            Text {
                                                text: "array"
                                                color: textColor
                                            }
                                            
                                        }
                                        
                                        // Array values with indentation
                                        ColumnLayout {
                                            Layout.fillWidth: true
                                            Layout.leftMargin: 150
                                            spacing: 4
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[0]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "2900"; color: textColor; font.pixelSize: 13 }
                                            }
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[1]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "12000"; color: textColor; font.pixelSize: 13 }
                                            }
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[2]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "360"; color: textColor; font.pixelSize: 13 }
                                            }
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[3]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "60000"; color: textColor; font.pixelSize: 13 }
                                            }
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[4]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "59"; color: textColor; font.pixelSize: 13 }
                                            }
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[5]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "8500"; color: textColor; font.pixelSize: 13 }
                                            }
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[6]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "0"; color: textColor; font.pixelSize: 13 }
                                            }
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[7]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "10"; color: textColor; font.pixelSize: 13 }
                                            }
                                            
                                            RowLayout {
                                                spacing: 8
                                                Text { text: "[8]:"; color: secondaryTextColor; font.pixelSize: 13 }
                                                Text { text: "100"; color: textColor; font.pixelSize: 13 }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // // Action buttons row
                    // RowLayout {
                    //     Layout.fillWidth: true
                    //     spacing: 10
                    //
                    //     PlasmaComponents.Button {
                    //         text: "View on Explorer"
                    //         icon.name: "globe"
                    //         Layout.fillWidth: true
                    //     }
                    //
                    //     PlasmaComponents.Button {
                    //         text: "Write"
                    //         icon.name: "document-edit"
                    //         Layout.fillWidth: true
                    //     }
                    //
                    //     PlasmaComponents.Button {
                    //         text: "Read"
                    //         icon.name: "document-open"
                    //         Layout.fillWidth: true
                    //     }
                    // }
                }
            }

            // Right side - Contract operations
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 12
                color: cardBgColor

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 20

                    // Read operations section
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        radius: 8
                        color: Qt.lighter(cardBgColor, 1.1)

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 10

                            Text {
                                text: "Read"
                                color: textColor
                                font.bold: true
                                font.pixelSize: 16
                            }

                            Flickable {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                contentHeight: contractReadOperationsLayout.height
                                clip: true
                                
                                ColumnLayout {
                                    id: contractReadOperationsLayout
                                    width: parent.width
                                    spacing: 15

                                    Text {
                                        text: "function1()"
                                        color: secondaryTextColor
                                        Layout.preferredWidth: 150
                                    }

                                    Text {
                                        text: "function2()"
                                        color: secondaryTextColor
                                        Layout.preferredWidth: 150
                                    }
                                }

                            }

                        }
                    }

                    // Write operations section
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        radius: 8
                        color: Qt.lighter(cardBgColor, 1.1)

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 10

                            Text {
                                text: "Write"
                                color: textColor
                                font.bold: true
                                font.pixelSize: 16
                            }

                            Flickable {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                contentHeight: contractOperationsLayout.height
                                clip: true
                                
                                ColumnLayout {
                                    id: contractOperationsLayout
                                    width: parent.width
                                    spacing: 15

                                    Text {
                                        text: "function1()"
                                        color: secondaryTextColor
                                        Layout.preferredWidth: 150
                                    }

                                    Text {
                                        text: "function2()"
                                        color: secondaryTextColor
                                        Layout.preferredWidth: 150
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }
    }
    
    // Model for contract list
    ListModel {
        id: contractsModel
        
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
