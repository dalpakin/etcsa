import 'package:etcsa/core/models/patient_report_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/common/search_bar.dart';
import 'draft_form_box_patient.dart';

class DraftPatientFormListView extends StatefulWidget {
  static const route = '/draft-form/list/patient';

  const DraftPatientFormListView({super.key});

  @override
  State<DraftPatientFormListView> createState() =>
      _DraftPatientFormListViewState();
}

class _DraftPatientFormListViewState extends State<DraftPatientFormListView> {
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

  void _handleDismiss(int id) {
    setState(() {
      reportList.removeWhere((report) => report.ID == id);
    });
  }

  void _handleSwipeRight(int id) {
    // Handle right swipe action here
    print('Swiped right on item with ID: $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Draft Patient Form List",
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          CustomSearchBar(
            onSearch: _handleSearch,
            isPatient: true,
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
                      return DraftFormBoxPatient(
                        patientReportModel: report,
                        onDismissed: () => _handleDismiss(report.ID),
                        onSwipedRight: () => _handleSwipeRight(report.ID),
                      );
                    },
                  );
                } else {
                  // Use ListView for narrower screens
                  return ListView.builder(
                    itemCount: reportList.length,
                    itemBuilder: (context, index) {
                      final report = reportList[index];
                      return DraftFormBoxPatient(
                        patientReportModel: report,
                        onDismissed: () => _handleDismiss(report.ID),
                        onSwipedRight: () => _handleSwipeRight(report.ID),
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
