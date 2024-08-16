
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class PieChartUnit extends StatefulWidget {
  final List<int> values;
  final List<String> titles;
  final List<Color> colors;

  const PieChartUnit(
      {super.key,
        required this.values,
        required this.titles,
        required this.colors});

  @override
  _PieChartUnitState createState() => _PieChartUnitState();
}

class _PieChartUnitState extends State<PieChartUnit> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double aspectRatio = deviceWidth > 600 ? 1.5 : 1.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 65,
                sections: showingSections(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < widget.titles.length; i++)
                Indicator(
                  color: widget.colors[i],
                  text: widget.titles[i],
                  isSquare: false,
                ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        )
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.values.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;

      return PieChartSectionData(
        color: widget.colors[i],
        value: widget.values[i].toDouble(),
        title: '${widget.values[i]}',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: const Color(0xffffffff),
        ),
      );
    });
  }
}
