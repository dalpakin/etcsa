import 'package:flutter/material.dart';

import '../../../core/models/patient_report_model.dart';

class DraftFormBoxPatient extends StatelessWidget {
  final PatientReportModel patientReportModel;
  final VoidCallback onDismissed;
  final VoidCallback onSwipedRight;

  const DraftFormBoxPatient({
    super.key,
    required this.patientReportModel,
    required this.onDismissed,
    required this.onSwipedRight,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(patientReportModel.ID.toString()),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: const Icon(Icons.send, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await _confirmDeletion(context);
        }
        return true;
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDismissed();
        } else if (direction == DismissDirection.startToEnd) {
          onSwipedRight();
        }
      },
      child: GestureDetector(
        onTap: _navigateToAddForm,
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
                  child: lastChangeDate(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _confirmDeletion(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Deletion'),
            content: const Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Delete',style: TextStyle(color: Colors.red),),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _navigateToAddForm() {
    // Implement navigation logic here
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
      patientReportModel.saveEpoch.toString(),
      textAlign: TextAlign.center,
    );
  }
}
