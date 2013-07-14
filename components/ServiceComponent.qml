import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.Popups 0.1
import "../ui"
Template{

    TemplateSection{
        title: i18n.tr("Service Mode");
        description: i18n.tr("Service mode allows you to get access to low-level settings of the car. It can bring attention to the output of the car down!")
        TemplateRow{
            title: i18n.tr("Enable service mode")
            titleWidth: 500

            CheckBox{
                id: serviceCheckBox
                onCheckedChanged: if(serviceCheckBox.checked)
                                  {
                                      serviceDialog.show()
                                  }
                                  else
                                  {
                                      sconf.serviceMode = false;
                                  }
                checked: sconf.serviceMode;
            }
        }
    }

    Dialog{
        id: serviceDialog
        title: i18n.tr("Are you sure?")
        Button{
            id: serviceDialogNo
            text: i18n.tr("No")
            color: UbuntuColors.orange
            onClicked: {
                PopupUtils.close(serviceDialog)
                sconf.serviceMode = false
                serviceCheckBox.checked = false
            }
        }

        Button{
            id: serviceDialogYes
            text: i18n.tr("Yes")
            color: UbuntuColors.warmGrey
            onClicked: {
                PopupUtils.close(serviceDialog)
                sconf.serviceMode = true
                serviceCheckBox.checked = true
            }
        }
    }

}


