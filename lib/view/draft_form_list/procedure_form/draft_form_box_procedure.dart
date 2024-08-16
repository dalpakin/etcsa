import 'package:etcsa/core/models/procedure_report_model.dart';
import 'package:flutter/material.dart';

class DraftFormBoxProcedure extends StatelessWidget {
  final ProcedureReportModel procedureReportModel;
  final VoidCallback onDismissed;
  final VoidCallback onSwipedRight;

  const DraftFormBoxProcedure({
    super.key,
    required this.procedureReportModel,
    required this.onDismissed,
    required this.onSwipedRight,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(procedureReportModel.ID.toString()),
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
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _navigateToAddForm() {
    // Implement navigation logic here
  }

  Widget procedureText() {
    //todo temp
    return procedureReportModel.procedureID == -1
        ? const Text("Empty Illness Script")
        : Text(
            procedureReportModel.procedureText ??
                "procedureReportModel.procedureTextprocedureReportModel.procedureTextprocedureReportModel.procedureTextprocedureReportModel.procedureTextprocedureReportModel.procedureTextprocedureReportModel.procedureTextprocedureReportModel.procedureTextprocedureReportModel.procedureTextprocedureReportModel.procedureText",
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
      procedureReportModel.saveEpoch.toString(),
      textAlign: TextAlign.center,
    );
  }
}
