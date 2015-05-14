#include <QDebug>
#include "sensor.h"

Sensor::Sensor(QObject *parent) : QObject(parent)
{
    name = QString("Unknow sensor");
}

void Sensor::setValue(float value)
{
    if(value > max_val)
    {
        qDebug() << "SENSOR "<< name <<" is HIGHT:" << val;
        emit sensorDanger();
    }
    emit valueChanged();
    val = value;
}
