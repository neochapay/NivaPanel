import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

MainView {
    ListModel {
        id: contactModel

        ListElement {
            name: i18n.tr("Engine")
            source: "EngineComponent.qml"
        }
        ListElement {
            name: i18n.tr("Light")
        }
        ListElement {
            name: i18n.tr("Climat Control")
        }
        ListElement {
            name: i18n.tr("Doors and Windows")
        }
        ListElement {
            name: i18n.tr("Network")
        }
        ListElement {
            name: i18n.tr("MultiMedia")
        }
        ListElement {
            name: i18n.tr("Navigation")
        }
        ListElement {
            name: i18n.tr("Service")
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
