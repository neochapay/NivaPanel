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
    QString s_mode = SqlConnect::getConfigValue("SERVICE MODE");
    if(s_mode == "TRUE")
    {
        setServiceMode(true);
    }
    else
    {
        setServiceMode(false);
    }
}

bool SqlConnect::isServiceMode() const
{
    return serviceMode;
}

void SqlConnect::setServiceMode(const bool &value)
{
    if(value)
    {
        QString qstr = "UPDATE config SET `value` = 'TRUE' WHERE `name` = 'SERVICE MODE'";
    }
    else
    {
        QString qstr = "UPDATE config SET `value` = 'FALSE' WHERE `name` = 'SERVICE MODE'";
    }
    QSqlQuery check;
    check.exec(qstr);

    serviceMode = value;
}

QString SqlConnect::getConfigValue(const QString value)
{
    QSqlQuery a_query;
    QString sql = "SELECT value FROM config WHERE name = '%1'";
    sql = sql.arg(value);
    a_query.exec(sql);

    QSqlRecord rec = a_query.record();
    a_query.next();
    QString answer = a_query.value(rec.indexOf("value")).toString();

    return answer;
}

void SqlConnect::setConfigValue(const QString name, const QString value)
{
    QSqlQuery a_query;
    QString sql;
    if(SqlConnect::getConfigValue(name) == "")
    {
        qDebug() << "ADD NEW VALUE";
        sql = "INSERT INTO config (`name`, `value`) VALUES ('%1', '%2')";
        sql = sql.arg(name);
        sql = sql.arg(value);
        a_query.exec(sql);
    }
    else
    {
        qDebug() << "UPDATE VALUE";
        sql = "UPDATE config SET `value` = '%2' WHERE `name` = '%1'";
        sql = sql.arg(name);
        sql = sql.arg(value);
        a_query.exec(sql);
    }
}
