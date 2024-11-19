import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatelessWidget {
  final List<_ChartData> chartData = [
    _ChartData('Reward', 24, Color(0xFF4A00E0)),
    _ChartData('Ecosystem Development', 18, Color(0xFF8E2DE2)),
    _ChartData('Treasury', 10, Color(0xFFF953C6)),
    _ChartData('Seed Round', 12, Color(0xFFFFAE00)),
    _ChartData('Public Sale', 3, Color(0xFFFF6B6B)),
    _ChartData('Marketing', 12, Color(0xFF00F260)),
    _ChartData('Team', 11, Color(0xFF00C9FF)),
    _ChartData('Liquidity', 10, Color(0xFF0099F7)),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Container(
            child: Text(
              'Total Supply\n50,000,000',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      series: <DoughnutSeries<_ChartData, String>>[
        DoughnutSeries<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData data, _) => data.category,
          yValueMapper: (_ChartData data, _) => data.percentage,
          pointColorMapper: (_ChartData data, _) => data.color,
          dataLabelMapper: (_ChartData data, _) => '${data.percentage}%',
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            textStyle: TextStyle(color: Colors.black, fontSize: 10),
          ),
          innerRadius: '70%',
        ),
      ],
    );
  }
}

class _ChartData {
  final String category;
  final double percentage;
  final Color color;

  _ChartData(this.category, this.percentage, this.color);
}
