import 'package:flutter/material.dart';

import '../../../../core/models/course.dart';
import '../../../../core/models/patient_report_model.dart';
import '../../common/custom_dropdown_button.dart';
import '../../common/search_bar.dart';
import '../filter_app_button_list.dart';
import 'sent_form_box_patient.dart';

class PatientSentFormListView extends StatefulWidget {
  static const route = '/sent-form/list/patient';

  const PatientSentFormListView({super.key});

  @override
  State<PatientSentFormListView> createState() =>
      _PatientSentFormListViewState();
}

class _PatientSentFormListViewState extends State<PatientSentFormListView> {
  bool checkAccept = false; //to get Accepted reports
  bool checkReject = false; //to get rejected reports
  bool checkWaiting = false; //to get waiting reports

  CourseModel? selectedCourseValue;
  final List<CourseModel> courseItems = [
    CourseModel(1, 'CCS 510', "DFDGFDGFF"),
    CourseModel(2, 'CCS 345', "nulFDGDGFDGGFDGGDFGDl"),
    CourseModel(3, 'CCS 452', "GDGGFDGGDFGFDG"),
  ];

  List<PatientReportModel> reportList = [
    PatientReportModel(ID: 0),
    PatientReportModel(ID: 1),
    PatientReportModel(ID: 2),
    PatientReportModel(ID: 3),
    PatientReportModel(ID: 4),
    PatientReportModel(ID: 5),
    PatientReportModel(ID: 6),
  ];

  void _handleSearch(String query) {
    print('Search query: $query');
  }

  void changeColorByIndex(int index) {
    setState(() {
      switch (index) {
        case 1:
          checkAccept = !checkAccept;
          break;
        case 2:
          checkWaiting = !checkWaiting;
          break;
        case 3:
          checkReject = !checkReject;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sent Patient Forms",
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
      ),
      body: Column(
        children: <Widget>[
          CustomSearchBar(
            onSearch: _handleSearch,
            isPatient: true,
          ),
          const SizedBox(height: 20),
          FilterApprovementButtonList(
            checkAccept: checkAccept,
            checkWaiting: checkWaiting,
            checkReject: checkReject,
            changeColorByIndex: changeColorByIndex,
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  // Use GridView for wider screens
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                    ),
                    itemCount: reportList.length,
                    itemBuilder: (context, index) {
                      final report = reportList[index];
                      return SentFormBoxPatient(
                        patientReportModel: report,
                      );
                    },
                  );
                } else {
                  // Use ListView for narrower screens
                  return ListView.builder(
                    itemCount: reportList.length,
                    itemBuilder: (context, index) {
                      final report = reportList[index];
                      return SentFormBoxPatient(
                        patientReportModel: report,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
