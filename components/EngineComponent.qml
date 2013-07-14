import QtQuick 2.0
import Ubuntu.Components 0.1
import "../ui"

Template{
    TemplateSection{
        title: "Configure you engine"
        TemplateRow{
            title: "Allow start the engine without a key"
            titleWidth: 500
            CheckBox{
                id: woutKeyCheckBox

            }
        }
    }

    TemplateSection{
        title: "Service mode of engine"
        description: "Do not change these values ​​if you are not an expert. Incorrect values ​​may lead to the conclusion engine failure."
        visible: sconf.serviceMode
        TemplateRow{
            title: "Warning temp"
            titleWidth: 150

            Slider{
                id: wTempSlider
                width: 400
                minimumValue: 50
                maximumValue: 150
            }
        }
        TemplateRow{
            title: "Error temp"
            titleWidth: 150

            Slider{
                id: eTempSlider
                width: 400
                minimumValue: 50
                maximumValue: 150
            }
        }

        TemplateRow{
            title: "Maximum RPM"
            titleWidth: 150

            Slider{
                id: mRpmSlider
                width: 400
                minimumValue: 1000
                maximumValue: 7000
            }
        }
    }
}
