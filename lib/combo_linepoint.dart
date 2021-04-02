/// Example of a numeric combo chart with two series rendered as lines, and a
/// third rendered as points along the top line with a different color.
///
/// This example demonstrates a method for drawing points along a line using a
/// different color from the main series color. The line renderer supports
/// drawing points with the "includePoints" option, but those points will share
/// the same color as the line.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class NumericComboLinePointChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NumericComboLinePointChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory NumericComboLinePointChart.withSampleData() {
    return new NumericComboLinePointChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.NumericComboChart(seriesList,
        animate: animate,
        // Configure the default renderer as a line renderer. This will be used
        // for any series that does not define a rendererIdKey.
        defaultRenderer: new charts.LineRendererConfig(),
        // Custom renderer configuration for the point series.
        customSeriesRenderers: [
          new charts.PointRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customPoint')
        ]);
  }

  static List<charts.Series<GraphData, double>> mmComboGraphData(
      List<List<GraphData>> dataList) {
    List<charts.Series<GraphData, double>> comboGraphDataList =
        List<charts.Series<GraphData, double>>();
    print(dataList.length);
    for (int i = 0; i < dataList.length; i++) {
      List<GraphData> data = dataList[i];
      comboGraphDataList.add(charts.Series<GraphData, double>(
          id: 'Graph' + i.toString(),
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (GraphData graph, _) => graph.xValue,
          measureFn: (GraphData graph, _) => graph.yValue,
          data: data));
    }
    return comboGraphDataList;
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GraphData, double>> _createSampleData() {
    final desktopyValueData = [
      new GraphData(0, 5),
      new GraphData(1, 25),
      new GraphData(2, 100),
      new GraphData(3, 75),
    ];

    final tableyValueData = [
      new GraphData(0, 10),
      new GraphData(1, 50),
      new GraphData(2, 200),
      new GraphData(3, 150),
    ];

    final mobileyValueData = [
      new GraphData(0, 100),
      new GraphData(1, 50),
      new GraphData(2, 150),
      new GraphData(3, 100),
    ];

    return mmComboGraphData(
        [desktopyValueData, tableyValueData, mobileyValueData]);
    // return [
    //   new charts.Series<GraphData, int>(
    //     id: 'Desktop',
    //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
    //     domainFn: (GraphData yValue, _) => yValue.xValue,
    //     measureFn: (GraphData yValue, _) => yValue.yValue,
    //     data: desktopyValueData,
    //   ),
    //   new charts.Series<GraphData, int>(
    //     id: 'Tablet',
    //     colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
    //     domainFn: (GraphData yValue, _) => yValue.xValue,
    //     measureFn: (GraphData yValue, _) => yValue.yValue,
    //     data: tableyValueData,
    //   ),
    //   new charts.Series<GraphData, int>(
    //       id: 'Mobile',
    //       colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
    //       domainFn: (GraphData yValue, _) => yValue.xValue,
    //       measureFn: (GraphData yValue, _) => yValue.yValue,
    //       data: mobileyValueData)
    //   // Configure our custom point renderer for this series.
    //   //..setAttribute(charts.rendererIdKey, 'customPoint'),
    //];
  }
}

/// Sample linear data type.
class GraphData {
  final double xValue;
  final double yValue;

  GraphData(this.xValue, this.yValue);
}