/// Forward pattern hatch bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Forward hatch pattern horizontal bar chart example.
///
/// The second series of bars is rendered with a pattern by defining a
/// fillPatternFn mapping function.
class HorizontalPatternForwardHatchBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalPatternForwardHatchBarChart(this.seriesList, {this.animate});

  factory HorizontalPatternForwardHatchBarChart.withSampleData() {
    return new HorizontalPatternForwardHatchBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec( ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('Transunion', 580),
      new OrdinalSales('Equifax', 650),
      new OrdinalSales('Experian', 750),
    ];

    final tableSalesData = [
      new OrdinalSales('Transunion', 750),
      new OrdinalSales('Equifax', 590),
      new OrdinalSales('Experian', 780),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Before',
        seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade300),
        domainFn: (OrdinalSales score, _) => score.bureau,
        measureFn: (OrdinalSales score, _) => score.score,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'After',
        seriesColor: charts.ColorUtil.fromDartColor(Colors.green.shade700),
        domainFn: (OrdinalSales score, _) => score.bureau,
        measureFn: (OrdinalSales score, _) => score.score,
        data: tableSalesData,
        fillPatternFn: (OrdinalSales score, _) =>
            charts.FillPatternType.forwardHatch,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String bureau;
  final int score;

  OrdinalSales(this.bureau, this.score);
}
