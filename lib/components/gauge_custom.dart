import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeCustomer extends StatelessWidget {
  final Color color;
  final String valueScore;
  final double percentValue;
  const GaugeCustomer({
    Key key,
    this.color,
    this.valueScore = "0",
    this.percentValue = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            axisLineStyle: AxisLineStyle(
                thickness: 0.2,
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.bothCurve),
            showTicks: false,
            showLabels: false,
            onAxisTapped: (value) {},
            pointers: <GaugePointer>[
              RangePointer(
                  color: color,
                  value: percentValue,
                  onValueChanged: (value) {},
                  cornerStyle: CornerStyle.bothCurve,
                  onValueChangeEnd: (value) {},
                  onValueChanging: (value) {},
                  enableDragging: false,
                  width: 0.2,
                  sizeUnit: GaugeSizeUnit.factor)
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueScore,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "850",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                positionFactor: 0.13,
                angle: 0.5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
