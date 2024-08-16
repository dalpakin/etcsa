import 'package:etcsa/core/models/procedure_report_model.dart';
import 'package:flutter/material.dart';

import '../../components/common/search_bar.dart';
import 'draft_form_box_procedure.dart';

class DraftProcedureFormListView extends StatefulWidget {
  static const route = '/draft-form/list/procedure';

  const DraftProcedureFormListView({super.key});

  @override
  State<DraftProcedureFormListView> createState() =>
      _DraftPatientFormListViewState();
}

class _DraftPatientFormListViewState extends State<DraftProcedureFormListView> {
  List<ProcedureReportModel> reportList = [
    ProcedureReportModel(ID: 0),
    ProcedureReportModel(ID: 1),
    ProcedureReportModel(ID: 2),
    ProcedureReportModel(ID: 3),
    ProcedureReportModel(ID: 4),
    ProcedureReportModel(ID: 5),
    ProcedureReportModel(ID: 6),
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
          "Draft Procedure Form List",
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          CustomSearchBar(
            onSearch: _handleSearch,
            isPatient: false,
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
                      return DraftFormBoxProcedure(
                        procedureReportModel: report,
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
                      return DraftFormBoxProcedure(
                        procedureReportModel: report,
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
