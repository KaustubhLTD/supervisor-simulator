import 'package:flutter/material.dart';
import 'package:flutter_application_1/combo_linepoint.dart';
import 'package:flutter_application_1/line_chart.dart';



class SimulationGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
          child: Column(
        children: [
          Container(
            child: NumericComboLinePointChart.withSampleData(),
            height: 100,
            width: 500,
          ),

          Container(
            child: SimpleLineChart.withRandomData(),
            height: 100,
            width: 500,
          ),
          Container(
            child: SimpleLineChart.withRandomData(),
            height: 100,
            width: 500,
          ),
          // Container(
          //   child: CustomAxisTickFormatters.withRandomData(),
          //   height: 100,
          //   width: 500,
          // ),
          //SimpleLineChart.withRandomData(),
          //SimpleLineChart.withRandomData()
        ],
      )),
    );
  }
}