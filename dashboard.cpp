#include <QDebug>
#include <QNetworkAccessManager>

#include "dashboard.h"
#include "config.h"

DashboardClass::DashboardClass(QObject *parent) :
    QObject(parent)
{
//Устанавливаем значения при запуске на ноль
    setRpm(0);
    setVehicleSpeed(0);
    setBoost(0);
    setFuelLevel(0);
    setOilPressure(0);
    setCoolantTemperature(0);
    setVoltage(0);
}
// Получаем параметры
float DashboardClass::getRpm() const
{
    return rpm;
}

float DashboardClass::getVehicleSpeed() const
{
    return vehicleSpeed;
}

float DashboardClass::getBoost() const
{
    return boost;
}

float DashboardClass::getFuelLevel() const
{
    return fuelLevel;
}

float DashboardClass::getOilPressure() const
{
    return oilPressure;
}

float DashboardClass::getCoolantTemperature() const
{
    return coolantTemperature;
}

float DashboardClass::getVoltage() const
{
    return voltage;
}

//Устанавливаем параметры
void DashboardClass::setRpm(const float &value)
{
    if(value > MAX_RPM)
    {
        qDebug() << "RPM is HIGHT." << value;
    }
    rpm = value;
}

void DashboardClass::setVehicleSpeed(const float &value)
{
    vehicleSpeed = value;
}

void DashboardClass::setBoost(const float &value)
{
    boost = value;
}

void DashboardClass::setFuelLevel(const float &value)
{
    if(value < MIN_FUEL)
    {
        qDebug() << "Fuel is LOW.";
    }
    fuelLevel = value;
}

void DashboardClass::setOilPressure(const float &value)
{
    oilPressure = value;
}

void DashboardClass::setCoolantTemperature(const float &value)
{
    if(value > MAX_CTEMP)
    {
        qDebug() << "Coolant temp is HIGHT. Temp is" << value;
    }
    coolantTemperature = value;
}

void DashboardClass::setVoltage(const float &value)
{
    if (value < MIN_VOLT)
    {
        qDebug() << "Voltage LOW. Voltage is" << value;
    }
    else if (value > MAX_VOLT)
    {
        qDebug() << "Voltage HIGHT. Voltage is" << value;
    }
    voltage = value;
}

