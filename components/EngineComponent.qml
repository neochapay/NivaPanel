import QtQuick 2.0
import Ubuntu.Components 0.1
import "../ui"

Template{
    TemplateSection{
        title: i18n.tr("Configure you engine")
        TemplateRow{
            title: i18n.tr("Allow start the engine without a key")
            titleWidth: 500
            CheckBox{
                id: woutKeyCheckBox
            }
        }
    }

    TemplateSection{
        title: i18n.tr("Service mode of engine")
        description: i18n.tr("Do not change these values ​​if you are not an expert. Incorrect values ​​may lead to the conclusion engine failure.")
        visible: sconf.serviceMode
        TemplateRow{
            title: i18n.tr("Warning temp")
            titleWidth: 150

            Slider{
                id: wTempSlider
                width: 400
                minimumValue: 50
                maximumValue: 150
            }
        }
        TemplateRow{
            title: i18n.tr("Error temp")
            titleWidth: 150

            Slider{
                id: eTempSlider
                width: 400
                minimumValue: 50
                maximumValue: 150
            }
        }

        TemplateRow{
            title: i18n.tr("Maximum RPM")
            titleWidth: 150

            Slider{
                id: mRpmSlider
                width: 400
                minimumValue: 1000
                maximumValue: 7000
            }
        }

        TemplateRow{
            title: i18n.tr("Idling RPM")
            titleWidth: 150

            Slider{
                id: iRpmSlider
                width: 400
                minimumValue: 100
                maximumValue: 1500
            }
        }
    }
}
