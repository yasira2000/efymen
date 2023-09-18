import 'package:efymen/models/BarData.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeekBarGraph extends StatelessWidget {
  final List weeklySummary;
  const WeekBarGraph({
    super.key,
    required this.weeklySummary,
  });

  @override
  Widget build(BuildContext context) {
    BarData myChart = BarData(
      mon: weeklySummary[0],
      tue: weeklySummary[1],
      wed: weeklySummary[2],
      thu: weeklySummary[3],
      fri: weeklySummary[4],
      sat: weeklySummary[5],
      sun: weeklySummary[6],
    );

    myChart.initBarData();

    return BarChart(
      BarChartData(
        maxY: 24,
        minY: 0,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.black38.withOpacity(0.2),
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.black26.withOpacity(0.2),
            ),
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            axisNameSize: 20,
            axisNameWidget: const Center(
              child: Text(
                'Hours of the day',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ),
            drawBelowEverything: true,
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  textAlign: TextAlign.left,
                );
              },
            ),
          ),
          bottomTitles: const AxisTitles(
              axisNameSize: 20,
              axisNameWidget: Text(
                'days of the week',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                getTitlesWidget: getBottomTitles,
              )),
        ),
        barGroups: myChart.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y + 3.21,
                    width: 5,
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  BarChartRodData(
                    toY: data.y - 1.43,
                    width: 5,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  BarChartRodData(
                    toY: data.y,
                    width: 5,
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(4),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );

  Widget text;

  switch (value.toInt()) {
    case 0:
      text = const Text(
        'MON',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'TUE',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'WED',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'THU',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'FRI',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'SAT',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'SUN',
        style: style,
      );
      break;
    default:
      text = const Text(
        'W',
        style: style,
      );
  }

  return text;
}
