import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import QtGraphicalEffects 1.15
import QtQml 2.15

ListModel {
    ListElement { name: "Ethereum Mainnet"; symbol: "ETH"; iconColor: "#627eea"; isActive: true }
    ListElement { name: "Binance Smart Chain"; symbol: "BNB"; iconColor: "#F0B90B"; isActive: false }
    ListElement { name: "Polygon"; symbol: "MATIC"; iconColor: "#8247E5"; isActive: false }
    ListElement { name: "Arbitrum One"; symbol: "ETH"; iconColor: "#28A0F0"; isActive: false }
    ListElement { name: "Optimism"; symbol: "ETH"; iconColor: "#FF0420"; isActive: false }
}
