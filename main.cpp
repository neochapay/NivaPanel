#include <QtGui/QGuiApplication>
#include <QQmlContext>

#include "qtquick2applicationviewer.h"
#include "dashboard.h"
#include "sqlconnect.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    DashboardClass Dashboard;
    SqlConnect Config;

    QtQuick2ApplicationViewer viewer;
    viewer.rootContext()->setContextProperty("dash", &Dashboard);
    viewer.rootContext()->setContextProperty("sconf", &Config);
    viewer.setMainQmlFile(QStringLiteral("qml/AutomobileDashboard.qml"));
    viewer.showExpanded();

    return app.exec();
}
