#include <QtSql>
#include "sqlconnect.h"
#include <string>

SqlConnect::SqlConnect(QObject *parent) :
    QObject(parent)
{
    QSqlDatabase sdb = QSqlDatabase::addDatabase("QSQLITE");
    sdb.setDatabaseName("dash.sqlite");

    if(!sdb.open())
    {
         qDebug() << sdb.lastError().text();
    }
    //setServiceMode(true);
}

bool SqlConnect::isServiceMode() const
{
    return serviceMode;
}

void SqlConnect::setServiceMode(const bool &value)
{
    if(value)
    {
        qstr = "UPDATE config SET `value` = 'TRUE' WHERE `name` = 'SERVICE MODE'";
    }
    else
    {
        qstr = "UPDATE config SET `value` = 'FALSE' WHERE `name` = 'SERVICE MODE'";
    }
    QSqlQuery check;
    check.exec(qstr);

    serviceMode = value;
}
