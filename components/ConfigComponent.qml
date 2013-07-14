import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Item {
    ListModel {
        id: contactModel

        ListElement {
            name: "Engine"
            source: "EngineComponent.qml"
        }
        ListElement {
            name: "Light"
        }
        ListElement {
            name: "Climat Control"
        }
        ListElement {
            name: "Doors and Windows"
        }
        ListElement {
            name: "Network"
        }
        ListElement {
            name: "MultiMedia"
        }
        ListElement {
            name: "Navigation"
        }
        ListElement {
            name: "Service"
            source: "ServiceComponent.qml"
        }
    }

    ListView {
         width: 180;
         height: tabs.height
         model: contactModel

         delegate: ListItem.Empty {
            height: units.gu(6)
            removable: false
            selected: enabled && viewColumn.source == Qt.resolvedUrl(model.source)
            Text {
                text: name
                anchors.centerIn: parent
            }
            onClicked: {
                if(model.source)
                {
                    colimtLabel.visible = false;
                    viewColumn.source = model.source;
                }
                else
                {
                    colimtLabel.visible = true;
                    viewColumn.source = "";
                    colimtLabel.text = model.name;
                }
            }
        }
    }
}
