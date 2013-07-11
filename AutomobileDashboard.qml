import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"
import "ui"

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    
    // Note! applicationName needs to match the .desktop filename
    applicationName: "AutomobileDashboard"
    
    /* 
     This property enables the application to change orientation 
     when the device is rotated. The default is false.
    */
    automaticOrientation: true
    
    width: 800
    height: 480
    
    Tabs{
        id: tabs
        DashboardTab{
            id: dashboardTabab
        }

        ConfigTab{
            id: configTab
        }
     }

    Button {
        objectName: "button"
        width: parent.width
        color: UbuntuColors.coolGrey

        text: i18n.tr("Quit Dashboard")
                
        onClicked: {
            Qt.quit();
         }
    }
}
