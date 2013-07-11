#ifndef SQLCONNECT_H
#define SQLCONNECT_H

#include <QObject>

class SqlConnect : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float serviceMode READ isServiceMode WRITE setServiceMode NOTIFY serviceModeChanged)

public:
    explicit SqlConnect(QObject *parent = 0);
    bool isServiceMode() const;
    void setServiceMode(const bool &);
    
signals:
    void serviceModeChanged();

public slots:

private:
    bool serviceMode;
    char* qstr;
};

#endif // SQLCONNECT_H
