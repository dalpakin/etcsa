import 'package:etcsa/core/models/procedure_report_model.dart';
import 'package:flutter/material.dart';

class SentFormBoxProcedure extends StatelessWidget {
  final ProcedureReportModel procedureReportModel;

  const SentFormBoxProcedure({super.key, required this.procedureReportModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToFormDetail,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: procedureText(),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: physician(),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    approvementStatus(),
                    const SizedBox(height: 10),
                    lastChangeDate(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget procedureText() {
    return procedureReportModel.procedureText == ""
        ? const Text("Empty Illness Script")
        : Text(
            procedureReportModel.procedureText ??
                "patientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScript",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          );
  }

  Widget physician() {
    if (procedureReportModel.attendingPhysicianID == -1) {
      return const Text("Empty Physician Choice");
    } else {
      return Text(
        procedureReportModel.attendingPhysicianID.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.w500,
            fontSize: 17),
      );
    }
  }

  Widget lastChangeDate() {
    return Text(
      procedureReportModel.sentEpoch.toString(),
      textAlign: TextAlign.center,
    );
  }

  Widget approvementStatus() {
    switch (procedureReportModel.isApproved) {
      case 0:
        return const Icon(
          Icons.update,
          color: Colors.yellow,
        );
      case 1:
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      case 2:
        return const Icon(
          Icons.cancel,
          color: Colors.red,
        );
    }
    return const Icon(
      Icons.cancel,
      color: Colors.red,
    );
  }

  Widget comment() {
    if (procedureReportModel.comment == "") {
      return const SizedBox();
    } else {
      return ElevatedButton(
        onPressed: _readComment,
        child: const Text("Read Comment"),
      );
    }
  }

  Widget revise() {
    if (procedureReportModel.isApproved == 2) {
      //rejected
      return ElevatedButton(
        onPressed: _revise,
        child: const Text("Revise"),
      );
    } else {
      return const SizedBox();
    }
  }

  void _navigateToFormDetail() {
    print("gfdgdf");
  }

  void _readComment() {}

  void _revise() {}
}
