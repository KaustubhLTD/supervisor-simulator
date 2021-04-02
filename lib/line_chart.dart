// Example of a simple line chart.
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final List<ChartRangeValues> rangeValues;

  SimpleLineChart(this.seriesList, {this.animate, this.rangeValues});

  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      animate: false,
    );
  }

  factory SimpleLineChart.withRandomData() {
    return new SimpleLineChart(_createRandomData(), animate: true);
  }

  static List<charts.Series<GraphData, num>> _createRandomData() {
    final random = new Random();

    final data = [
      new GraphData(0, random.nextDouble()),
      new GraphData(1, random.nextDouble()),
      new GraphData(2, random.nextDouble()),
      new GraphData(3, random.nextDouble()),
      new GraphData(4, random.nextDouble()),
      new GraphData(5, random.nextDouble()),
      new GraphData(6, random.nextDouble()),
      new GraphData(7, random.nextDouble()),
      new GraphData(8, random.nextDouble()),
      new GraphData(9, random.nextDouble()),
      new GraphData(10, random.nextDouble()),
      new GraphData(11, random.nextDouble()),
      new GraphData(12, random.nextDouble()),
      new GraphData(13, random.nextDouble()),
      new GraphData(14, random.nextDouble()),
      new GraphData(15, random.nextDouble()),
      new GraphData(16, random.nextDouble()),
      new GraphData(17, random.nextDouble()),
      new GraphData(18, random.nextDouble()),
      new GraphData(19, random.nextDouble()),
      new GraphData(20, random.nextDouble()),
      //new GraphData(11, random.nextDouble()),
    ];

    return [
      new charts.Series<GraphData, double>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (GraphData graph, _) => graph.xValue,
        measureFn: (GraphData graph, _) => graph.yValue,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList, animate: animate,
      //flipVerticalAxis: true,
      //added to hide axis
      // primaryMeasureAxis:
      //     new charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),

      // domainAxis: new charts.OrdinalAxisSpec(
      //     // Make sure that we draw the domain axis line.
      //     showAxisLine: true,
      //     // But don't draw anything else.
      //     renderSpec: new charts.NoneRenderSpec()),
      behaviors: rangeValues != null
          ? [ChartRangeValues.getLineAnnotation(rangeValues)]
          : null,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GraphData, double>> _createSampleData() {
    final data = [
      new GraphData(0, 5),
      new GraphData(1, 25),
      new GraphData(2, 100),
      new GraphData(3, 75),
    ];

    return [
      new charts.Series<GraphData, double>(
        id: 'Graph',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (GraphData graph, _) => graph.xValue,
        measureFn: (GraphData graph, _) => graph.yValue,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class GraphData {
  final double xValue;
  final double yValue;

  GraphData(this.xValue, this.yValue);
}

/////////////////////////////////////////////////
///
// class CustomAxisTickFormatters extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   CustomAxisTickFormatters(this.seriesList, {this.animate});

//   /// Creates a [TimeSeriesChart] with sample data and no transition.
//   factory CustomAxisTickFormatters.withSampleData() {
//     return new CustomAxisTickFormatters(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }

//   // EXCLUDE_FROM_GALLERY_DOCS_START
//   // This section is excluded from being copied to the gallery.
//   // It is used for creating random series data to demonstrate animation in
//   // the example app only.
//   factory CustomAxisTickFormatters.withRandomData() {
//     return new CustomAxisTickFormatters(_createRandomData());
//   }

//   /// Create random data.
//   static List<charts.Series<MyRow, DateTime>> _createRandomData() {
//     final random = new Random();

//     final data = [
//       new MyRow(new DateTime(2017, 9, 25), random.nextDouble()),
//       new MyRow(new DateTime(2017, 9, 26), random.nextDouble()),
//       new MyRow(new DateTime(2017, 9, 27), random.nextDouble()),
//       new MyRow(new DateTime(2017, 9, 28), random.nextDouble()),
//       new MyRow(new DateTime(2017, 9, 29), random.nextDouble()),
//       new MyRow(new DateTime(2017, 9, 30), random.nextDouble()),
//       new MyRow(new DateTime(2017, 10, 01), random.nextDouble()),
//       new MyRow(new DateTime(2017, 10, 02), random.nextDouble()),
//       new MyRow(new DateTime(2017, 10, 03), random.nextDouble()),
//       new MyRow(new DateTime(2017, 10, 04), random.nextDouble()),
//       new MyRow(new DateTime(2017, 10, 05), random.nextDouble()),
//     ];

//     return [
//       new charts.Series<MyRow, DateTime>(
//         id: 'Cost',
//         domainFn: (MyRow row, _) => row.timeStamp,
//         measureFn: (MyRow row, _) => row.cost,
//         data: data,
//       )
//     ];
//   }
//   // EXCLUDE_FROM_GALLERY_DOCS_END

//   @override
//   Widget build(BuildContext context) {
//     /// Formatter for numeric ticks using [NumberFormat] to format into currency
//     ///
//     /// This is what is used in the [NumericAxisSpec] below.
//     final simpleCurrencyFormatter =
//         new charts.BasicNumericTickFormatterSpec.fromNumberFormat(
//             new NumberFormat.compactSimpleCurrency());

//     /// Formatter for numeric ticks that uses the callback provided.
//     ///
//     /// Use this formatter if you need to format values that [NumberFormat]
//     /// cannot provide.
//     ///
//     /// To see this formatter, change [NumericAxisSpec] to use this formatter.
//     // final customTickFormatter =
//     //   charts.BasicNumericTickFormatterSpec((num value) => 'MyValue: $value');

//     return new charts.TimeSeriesChart(seriesList,
//         animate: animate,
//         // Sets up a currency formatter for the measure axis.
//         primaryMeasureAxis: new charts.NumericAxisSpec(
//             tickFormatterSpec: simpleCurrencyFormatter),

//         /// Customizes the date tick formatter. It will print the day of month
//         /// as the default format, but include the month and year if it
//         /// transitions to a new month.
//         ///
//         /// minute, hour, day, month, and year are all provided by default and
//         /// you can override them following this pattern.
//         domainAxis: new charts.DateTimeAxisSpec(
//             tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
//                 day: new charts.TimeFormatterSpec(
//                     format: 'd', transitionFormat: 'MM/dd/yyyy'))));
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<MyRow, DateTime>> _createSampleData() {
//     final data = [
//       new MyRow(new DateTime(2017, 9, 25), 6),
//       new MyRow(new DateTime(2017, 9, 26), 8),
//       new MyRow(new DateTime(2017, 9, 27), 6),
//       new MyRow(new DateTime(2017, 9, 28), 9),
//       new MyRow(new DateTime(2017, 9, 29), 11),
//       new MyRow(new DateTime(2017, 9, 30), 15),
//       new MyRow(new DateTime(2017, 10, 01), 25),
//       new MyRow(new DateTime(2017, 10, 02), 33),
//       new MyRow(new DateTime(2017, 10, 03), 27),
//       new MyRow(new DateTime(2017, 10, 04), 31),
//       new MyRow(new DateTime(2017, 10, 05), 23),
//     ];

//     return [
//       new charts.Series<MyRow, DateTime>(
//         id: 'Cost',
//         domainFn: (MyRow row, _) => row.timeStamp,
//         measureFn: (MyRow row, _) => row.cost,
//         data: data,
//       )
//     ];
//   }
// }

// /// Sample time series data type.
// class MyRow {
//   final DateTime timeStamp;
//   final int cost;
//   MyRow(this.timeStamp, this.cost);
// }

class LineRangeAnnotationChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final List<ChartRangeValues> rangeValues;

  LineRangeAnnotationChart(this.seriesList, {this.animate, this.rangeValues});

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      animate: animate,

      // Allow enough space in the left and right chart margins for the
      // annotations.
      // layoutConfig: new charts.LayoutConfig(
      //     leftMarginSpec: new charts.MarginSpec.fixedPixel(60),
      //     topMarginSpec: new charts.MarginSpec.fixedPixel(20),
      //     rightMarginSpec: new charts.MarginSpec.fixedPixel(60),
      //     bottomMarginSpec: new charts.MarginSpec.fixedPixel(20)),
      behaviors: [ChartRangeValues.getRangeAnnotation(rangeValues)],
    );
  }
}

class ChartRangeValues {
  double rangeStart;
  double rangeEnd;
  String rangeStartLabel;
  String rangeEndLabel;

  ChartRangeValues(
      {this.rangeStart,
      this.rangeEnd,
      this.rangeStartLabel,
      this.rangeEndLabel});

  static RangeAnnotation getRangeAnnotation(
      List<ChartRangeValues> rangeValues) {
    List<RangeAnnotationSegment> rangeAnnotationSegment =
        List<RangeAnnotationSegment>();

    for (ChartRangeValues rv in rangeValues) {
      rangeAnnotationSegment.add(charts.RangeAnnotationSegment(
        rv.rangeStart,
        rv.rangeEnd, charts.RangeAnnotationAxisType.domain, //measure
        startLabel: rv.rangeStartLabel,
        endLabel: rv.rangeEndLabel,
        labelAnchor: charts.AnnotationLabelAnchor.end,
        //color: charts.MaterialPalette.gray.shade300
      ));
    }
    return charts.RangeAnnotation(rangeAnnotationSegment,
        defaultLabelPosition: charts.AnnotationLabelPosition.margin);
  }

  static RangeAnnotation getLineAnnotation(List<ChartRangeValues> rangeValues) {
    List<LineAnnotationSegment> lineAnnotationSegment =
        List<LineAnnotationSegment>();

    for (ChartRangeValues rv in rangeValues) {
      lineAnnotationSegment.add(charts.LineAnnotationSegment(
          rv.rangeStart, charts.RangeAnnotationAxisType.domain, //measure
          startLabel: rv.rangeStartLabel,
          endLabel: rv.rangeEndLabel,
          labelAnchor: charts.AnnotationLabelAnchor.end,
          color: charts.MaterialPalette.gray.shade300));
    }
    return charts.RangeAnnotation(lineAnnotationSegment,
        defaultLabelPosition: charts.AnnotationLabelPosition.margin);
  }
}