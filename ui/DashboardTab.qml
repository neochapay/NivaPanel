import QtQuick 2.0
import Ubuntu.Components 0.1
import "../components"

Tab {
    title: i18n.tr("Dashboard")
    id: dashboardTable
    page: Page {
        Column {
            anchors{
                top: parent.top
                topMargin: 15
            }

            DashboardComponent {
            }
        }
    }
}
