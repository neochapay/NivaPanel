#ifndef SENSOR_H
#define SENSOR_H

#include <QVariant>

class Sensor : public QObject
{
    Q_OBJECT
public:
    explicit Sensor(QObject *parent = 0);
    void setValue(float value);
    void setMax(float value){max_val = value;}
    void setMin(float value){min_val = value;}
    void setName(QString n){name = n;}
    float getValue(){return val;}
    float getMinValue(){return min_val;}
    float getMaxValue(){return max_val;}
    QString getName(){return name;}

signals:
    void valueChanged();
    void nameChanged();
    void sensorDanger();

public slots:

private:
    float val;
    float max_val;
    float min_val;
    QString name;
};

#endif // SENSOR_H
