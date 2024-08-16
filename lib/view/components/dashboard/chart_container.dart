import 'package:flutter/material.dart';

import 'pie_chart_unit.dart';

List<String> progressTitles = ["Remaining", "Pending", "Approved", "Rejected"];

List<Color> progressColors = [
  Colors.grey,
  Colors.yellowAccent,
  Colors.green,
  Colors.red,
];

class ChartContainer extends StatelessWidget {
  final List<int> pieValuesPatient;
  final List<int> pieValuesProcedure;
  final bool showPatientChart;
  final bool showProcedureChart;

  const ChartContainer(
      {super.key,
      required this.showPatientChart,
      required this.showProcedureChart,
      required this.pieValuesPatient,
      required this.pieValuesProcedure});

  Widget emptyChartMessage(String type) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const Icon(
          Icons.warning,
          color: Colors.red,
          size: 150,
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 200,
          child: Text(
            "This course doesnt have any required $type form! But you can send as you whish!",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Patient Log Progress",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        showPatientChart
            ? PieChartUnit(
                values: pieValuesPatient,
                titles: progressTitles,
                colors: progressColors,
              )
            : emptyChartMessage("patient"),
        // Padding(
        //   padding: EdgeInsets.only(
        //       left: MediaQuery.of(context).size.width / 6.5,
        //       right: MediaQuery.of(context).size.width / 6.5),
        //   child: Divider(
        //       thickness: 0.3, color: AppColors.purplishBlue.withOpacity(0.7)),
        // ),
        const Text(
          "Procedure Log Progress",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        showProcedureChart
            ? PieChartUnit(
                values: pieValuesProcedure,
                titles: progressTitles,
                colors: progressColors,
              )
            : emptyChartMessage("procedure"),
      ],
    );
  }
}
