import 'package:flutter/material.dart';
import '../../../../core/models/patient_report_model.dart';

class SentFormBoxPatient extends StatelessWidget {
  final PatientReportModel patientReportModel;

  const SentFormBoxPatient({super.key, required this.patientReportModel});

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
                child: illnessScript(),
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

  Widget illnessScript() {
    return patientReportModel.illnessScript == ""
        ? const Text("Empty Illness Script")
        : Text(
            patientReportModel.illnessScript ??
                "patientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScriptpatientReportModel.illnessScript",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          );
  }

  Widget physician() {
    if (patientReportModel.attendingPhysicianID == -1) {
      return const Text("Empty Physician Choice");
    } else {
      return Text(
        patientReportModel.attendingPhysicianID.toString(),
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
      patientReportModel.sentEpoch.toString(),
      textAlign: TextAlign.center,
    );
  }

  Widget approvementStatus() {
    switch (patientReportModel.isApproved) {
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
    if (patientReportModel.comment == "") {
      return const SizedBox();
    } else {
      return ElevatedButton(
        onPressed: _readComment,
        child: const Text("Read Comment"),
      );
    }
  }

  Widget revise() {
    if (patientReportModel.isApproved == 2) {
      //rejected
      return ElevatedButton(
        onPressed: _revise,
        child: const Text("Revise"),
      );
    } else {
      return const SizedBox();
    }
  }

  void _navigateToFormDetail() {}

  void _readComment() {}

  void _revise() {}
}
