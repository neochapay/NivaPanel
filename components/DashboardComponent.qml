import QtQuick 2.0
import Ubuntu.Components 0.1

Item {
    width:parent.width
    height:310
    id: dashboard

    Button{
        // FIXME
        id: runEngine
        text: i18n.tr("Run")
        color: UbuntuColors.orange
        onClicked: {
            if(runEngine.text == "Run")
            {
                dash.voltage = 12
                dash.rpm = 900
                dash.oilPressure = 45
                runEngine.text = i18n.tr("Stop")
                dash.fuelLevel = 60
            }
            else
            {
                dash.voltage = 0
                dash.rpm = 0
                dash.oilPressure = 0
                runEngine.text = i18n.tr("Run")
            }

            voltNeedleRotation.angle = -1*Math.min( 35, Math.max(-35, ( ((dash.voltage-8) * (70/10)) - 35 )))
            tachoNeedleRotation.angle = Math.min( 83, Math.max(-117, ( (dash.rpm * (200/8000)) - 117 )))
            oilNeedleRotation.angle = -1*Math.min( 30, Math.max(-30, ( ((dash.oilPressure) * (60/80)) - 30 )))
            fuelNeedleRotation.angle = -1*Math.min( 30, Math.max(-30, ( ((dash.fuelLevel) * (60/100)) - 30 )))
        }
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 320
        anchors.leftMargin: 30
    }

    Image {
        id:tacho_back
        source:"images/tacho_back.png"
        x:0
        y:-3
        opacity:1
    }
    Image {
        id:tacho_gauge_ticks
        source:"images/tacho_gauge_ticks.png"
        x:19
        y:17
        opacity:1
    }
    Image {
        id:volt_needle_shadow
        smooth: true
        source:"images/volt_needle_shadow.png"
        x:151
        y:195
        opacity:0.8
        transform: Rotation {
            origin.x: 0; origin.y: 5
            angle: voltNeedleRotation.angle
        }
    }
    Image {
        id:tacho_needle_shadow
        smooth: true
        source:"images/tacho_needle_shadow.png"
        x:147
        y:31
        opacity:0.8
        transform: Rotation {
            origin.x: 10; origin.y: 120
            angle: tachoNeedleRotation.angle
        }
    }
    Image {
        id:volt_needle
        smooth: true
        source:"images/volt_needle.png"
        x:149
        y:193
        opacity:1
        transform: Rotation {
            id: voltNeedleRotation
            origin.x: 0; origin.y: 5
            angle: { -1*Math.min( 35, Math.max(-35, ( ((dash.voltage-8) * (70/10)) - 35 ))) } //XXX Clean up
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }
    Image {
        id:tacho_needle
        smooth: true
        source:"images/tacho_needle.png"
        x:146
        y:29
        opacity:1
        transform: Rotation {
            id: tachoNeedleRotation
            origin.x: 10; origin.y: 120
            angle: { Math.min( 83, Math.max(-117, ( (dash.rpm * (200/8000)) - 117 ))) } //XXX Clean up
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }

    Image {
        id:volt_needle_top
        source:"images/volt_needle_top.png"
        x:138
        y:179
        opacity:1
    }
    Image {
        id:tacho_needle_top
        source:"images/tacho_needle_top.png"
        x:130
        y:131
        opacity:1
    }
/*    Image {
        id:tacho_glare
        source:"images/tacho_glare.png"
        x:31
        y:125
        opacity:0.12156862745098
    }*/
    Image {
        id:third_gauge_back
        source:"images/third_gauge_back.png"
        x:483
        y:-5
        opacity:1
    }
    Image {
        id:third_gauge_ticks
        source:"images/third_gauge_ticks.png"
        x:502
        y:15
        opacity:1
    }
    Image {
        id:temp_needle_shadow
        smooth: true
        source:"images/turbo_needle_shadow.png"
        x:634
        y:56
        rotation: 0
        opacity:0.8
        transform: Rotation {
            origin.x: 20; origin.y: 60
            angle: tempNeedleRotation.angle
        }
    }
    Image {
        id:oil_needle_shadow
        smooth: true
        source:"images/oil_needle_shadow.png"
        x:637
        y:183
        opacity:0.8
        transform: Rotation {
            origin.x: 5; origin.y: 5
            angle: oilNeedleRotation.angle
        }
    }
    Image {
        id:fuel_needle_shadow
        smooth: true
        source:"images/fuel_needle_shadow.png"
        x:673
        y:148
        opacity:0.8
        transform: Rotation {
            origin.x: 0; origin.y: 5
            angle: fuelNeedleRotation.angle
        }
    }
    Image {
        id:temp_needle
        smooth: true
        source:"images/turbo_needle.png"
        x:634
        y:51
        transformOrigin: Item.Center
        z: 0
        rotation: 0
        opacity:1
        transform: Rotation {
            id: tempNeedleRotation
            origin.x: 20; origin.y: 60
            angle: { Math.min( 30, Math.max(-30, ( ((dash.coolantTemperature-100) * (60/160)) - 30 ))) } //XXX Clean up
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }
    Image {
        id:oil_needle
        smooth: true
        source:"images/oil_needle.png"
        x:634
        y:182
        opacity:1
        transform: Rotation {
            id: oilNeedleRotation
            origin.x: 5; origin.y: 5
            angle: { -1*Math.min( 30, Math.max(-30, ( ((dash.oilPressure) * (60/80)) - 30 ))) } //XXX Clean up
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }
    Image {
        id:fuel_needle
        smooth: true
        source:"images/fuel_needle.png"
        x:670
        y:145
        opacity:1
        transform: Rotation {
            id: fuelNeedleRotation
            origin.x: 0; origin.y: 5
            angle: { -1*Math.min( 30, Math.max(-30, ( ((dash.fuelLevel) * (60/100)) - 30 ))) } //XXX Clean up
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }
    Image {
        id:oil_needle_top
        source:"images/oil_needle_top.png"
        x:624
        y:166
        opacity:1
    }
    Image {
        id:fuel_needle_top
        source:"images/fuel_needle_top.png"
        x:654
        y:136
        opacity:1
    }
    Image {
        id:temp_needle_top
        source:"images/temp_needle_top.png"
        x:624
        y:107
        opacity:1
    }
/*    Image {
        id:third_gauge_glare
        source:"images/third_gauge_glare.png"
        x:630
        y:125
        opacity:0.12156862745098
    }*/
    Image {
        id:speedo_back
        source:"images/speedo_back.png"
        x:208
        y:-3
        opacity:1
    }
    Image {
        id:speedo_ticks
        source:"images/speedo_ticks.png"
        x:233
        y:27
        opacity:1
    }
    Image {
        id:speedo_needle_shadow
        source:"images/speedo_needle_shadow.png"
        x:389
        y:39
        opacity:0.8
        transform: Rotation {
            origin.x: 10; origin.y: 160
            angle: needleRotation.angle
        }
    }
    Image {
        id:speedo_needle
        source:"images/speedo_needle.png"
        x:389
        y:36
        opacity:1
        smooth: true
        transform: Rotation {
            id: needleRotation
            origin.x: 10; origin.y: 160
            angle: { Math.min( 135, Math.max(-135, ( ((dash.vehicleSpeed) * (270/120)) - 135 ))) } //XXX Clean up
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }
    Image {
        id:speedo_needle_top
        source:"images/speedo_needle_top.png"
        x:368
        y:159
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: speedo_back.horizontalCenter
        anchors.verticalCenter: speedo_back.verticalCenter
        opacity:1
    }
/*    Image {
        id:speedo_glare
        source:"images/speedo_glare.png"
        x:303
        y:172
        opacity:0.12156862745098
    }*/
/*    Image {
        id:tripometer_reset
        source:"images/tripometer_reset.png"
        x:404
        y:406
        opacity:1
    }*/
}
