#ifndef DASHBOARD_H
#define DASHBOARD_H

#include <QObject>

class DashboardClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float rpm READ getRpm WRITE setRpm NOTIFY rpmChanged)
    Q_PROPERTY(float vehicleSpeed READ getVehicleSpeed WRITE setVehicleSpeed NOTIFY vehicleSpeedChanged)
    Q_PROPERTY(float boost READ getBoost WRITE setBoost NOTIFY boostChanged)
    Q_PROPERTY(float fuelLevel READ getFuelLevel WRITE setFuelLevel NOTIFY fuelLevelChanged)
    Q_PROPERTY(float oilPressure READ getOilPressure WRITE setOilPressure NOTIFY oilPressureChanged)
    Q_PROPERTY(float coolantTemperature READ getCoolantTemperature WRITE setCoolantTemperature NOTIFY coolantTemperatureChanged)
    Q_PROPERTY(float voltage READ getVoltage WRITE setVoltage NOTIFY voltageChanged)

public:
    explicit DashboardClass(QObject *parent = 0);
    float getRpm()const;
    float getVehicleSpeed()const;
    float getBoost()const;
    float getFuelLevel()const;
    float getOilPressure()const;
    float getCoolantTemperature()const;
    float getVoltage()const;

    void setRpm(const float &);
    void setVehicleSpeed(const float &);
    void setBoost(const float &);
    void setFuelLevel(const float &);
    void setOilPressure(const float &);
    void setCoolantTemperature(const float &);
    void setVoltage(const float &);

private:
     float rpm;
     float vehicleSpeed;
     float boost;
     float fuelLevel;
     float oilPressure;
     float coolantTemperature;
     float voltage;

signals:
     void rpmChanged();
     void vehicleSpeedChanged();
     void boostChanged();
     void fuelLevelChanged();
     void oilPressureChanged();
     void coolantTemperatureChanged();
     void voltageChanged();
     void rpmTouch();

public slots:

};

#endif // DASHBOARD_H
