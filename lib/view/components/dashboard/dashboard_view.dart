import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/models/course.dart';
import '../common/custom_dropdown_button.dart';

class DashboardView extends StatefulWidget {
  static const route = '/dashboard';

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  CourseModel? selectedCourseValue;
  final List<CourseModel> courseItems = [
    CourseModel(1, 'CCS 510', "DFDGFDGFF"),
    CourseModel(2, 'CCS 345', "nulFDGDGFDGGFDGGDFGDl"),
    CourseModel(3, 'CCS 452', "GDGGFDGGDFGFDG"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomDropdownButton<CourseModel>(
              items: courseItems,
              value: selectedCourseValue,
              hint: "Current Course",
              onChanged: (value) {
                setState(() {
                  selectedCourseValue = value;
                });
              },
              itemToString: (item) => item.code,
              itemToId: (item) => item.id,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Text("data")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
