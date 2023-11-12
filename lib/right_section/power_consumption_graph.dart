import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../common/container.dart';
import '../constants/constant.dart';

class PowerConsumptionGraph extends StatefulWidget {
  const PowerConsumptionGraph({
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);
  final double width;
  final double height;

  @override
  _PowerConsumptionGraphState createState() => _PowerConsumptionGraphState();
}

class _PowerConsumptionGraphState extends State<PowerConsumptionGraph> {
  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      borderRadius: 30,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
                top: 52,
              ),
              child: LineChart(
                sampleElectricityData(),
              ),
            ),
            Positioned(
              top: 2,
              left: 4,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: true,
                        onChanged: (value) => {},
                        activeColor: AppColors.hotTemperature,
                        hoverColor: Colors.transparent,
                      ),
                      const Text(
                        'Electricity Consumed',
                        style: TextStyle(
                          color: AppColors.white,
                          letterSpacing: .13,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '73% Spending',
                    style: TextStyle(
                      color: AppColors.hotTemperature,
                      fontSize: 13,
                      letterSpacing: .13,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData sampleElectricityData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (event, touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 24,
          getTitlesWidget: (value, meta) {
            String text = '';
            switch (value.toInt()) {
              case 2:
                text = 'Sept';
                break;
              case 7:
                text = 'Oct';
                break;
              case 12:
                text = 'Dec';
                break;
            }
            return Text(text, style: const TextStyle(
            color: AppColors.roleTextColor,
                fontSize: 11,));
          },
          ),
        ),
        leftTitles: AxisTitles(sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 24,
          getTitlesWidget: (value, meta) {
            String text = '';
            switch (value.toInt() * 25) {
              case 0:
                text= '0';
                break;
              case 25:
                text= '25%';
                break;
              case 50:
                text= '50%';
                break;
              case 75:
                text= '75%';
                break;
              case 100:
                text= '100%';
            }
            return Text(text, style: const TextStyle(
            color: AppColors.roleTextColor,
                fontSize: 11,));
          },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 12,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(11, 2.2),
        FlSpot(12, 1.8),
      ],
      isCurved: true,
      color: AppColors.hotTemperature,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        color: AppColors.hotTemperature.withOpacity(.1),
        gradient: LinearGradient(
            colors: [AppColors.hotTemperature.withOpacity(.1), AppColors.hotTemperature.withOpacity(.1)],
          stops: const [.5, .2],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft
        ),
        show: true,
      ),
    );

    return [
      lineChartBarData1,
    ];
  }
}
