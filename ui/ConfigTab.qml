import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import "../components"

Tab {
    title: i18n.tr("Settings")
    id: configTab
    Page {
        Column{
            id: listColumn
            width: 180;
            height: tabs.height
            ConfigComponent{}

        }

        Page{
            id: viewColumn
            property alias source: contenLoader.source
            anchors.right:parent.left
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 190
            anchors.top: parent.top
            width: parent.width
            height: parent.height

            Label{
                id: colimtLabel

            }
            Loader{
                id: contenLoader
                objectName: "ContentLoader"
                source: "../components/EngineComponent.qml"
            }
        }
    }
}
