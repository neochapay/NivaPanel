import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.Popups 0.1
import "../ui"
Template{

    TemplateSection{
        title: "Service Mode";
        description: "Service mode allows you to get access to low-level settings of the car. It can bring attention to the output of the car down!"
        TemplateRow{
            title: "Enable service mode"
            titleWidth: 500

            CheckBox{
                id: serviceCheckBox
                onCheckedChanged: if(serviceCheckBox.checked)
                                  {
                                      serviceDialog.show()
                                  }
                checked: sconf.serviceMode;
            }
        }
    }

    Dialog{
        id: serviceDialog
        title: "Are you sure?"
        Button{
            id: serviceDialogNo
            text: "No"
            color: UbuntuColors.orange
            onClicked: {
                PopupUtils.close(serviceDialog)
                serviceCheckBox.state = "uncheck"
            }
        }

        Button{
            id: serviceDialogYes
            text: "Yes"
            color: UbuntuColors.warmGrey
            onClicked: PopupUtils.close(serviceDialog)
        }
    }

}

