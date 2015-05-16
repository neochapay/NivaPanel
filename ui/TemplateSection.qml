import QtQuick 2.0
import Ubuntu.Components 0.1

Column {
    id: templateSection
    spacing: units.gu(3)
    width: parent.width

    property string title
    property string description

    Item {
        anchors.left: parent.left
        anchors.right: parent.right
        height: childrenRect.height

        Label {
            id: label
            text: templateSection.title
            fontSize: "large"
            anchors.left: parent.left
            anchors.leftMargin: 40
        }

        Label{
            id: description
            text: templateSection.description
            anchors.top: label.bottom
            width: parent.width
            wrapMode: Text.WordWrap
        }
    }
}
