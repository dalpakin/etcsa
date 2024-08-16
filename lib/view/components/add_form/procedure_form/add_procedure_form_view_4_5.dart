import 'package:flutter/material.dart';

import '../../../../core/models/physician.dart';
import '../../../../core/models/procedure.dart';
import '../../../../core/models/setting.dart';
import '../../../../core/models/specialty.dart';
import '../../../../core/models/trainee_role.dart';
import '../../common/custom_dropdown_button.dart';
import '../../common/custom_multiple_checkbox.dart';
import '../../common/custom_radio_button.dart';

class AddProcedureFormView extends StatefulWidget {
  static const route = '/add-procedure-form-4-5';

  const AddProcedureFormView({super.key});

  @override
  State<AddProcedureFormView> createState() => _AddProcedureFormViewState();
}

class _AddProcedureFormViewState extends State<AddProcedureFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormFieldState> _specialtyKey = GlobalKey<FormFieldState>();
  late List<CheckBoxItem<TraineeRoleModel>> traineeItems;
  late List<RadioButtonItem<SettingModel>> settingItems;

  SpecialtyModel? selectedSpecialtyValue;
  final List<SpecialtyModel> specialtyItems = [
    SpecialtyModel(1, 'Cardiology'),
    SpecialtyModel(2, 'Dermatology'),
    SpecialtyModel(3, 'Gastroenterology'),
    SpecialtyModel(4, 'Neurology'),
    SpecialtyModel(5, 'Oncology'),
  ];

  ProcedureModel? selectedProcedureValue;
  final List<ProcedureModel> procedureItems = [
    ProcedureModel(id: 0, description: 'Taking PAP smear'),
    ProcedureModel(id: 0, description: 'Urinary Cath'),
    ProcedureModel(id: 0, description: 'Wound Dressing'),
  ];

  List<TraineeRoleModel> traineeList = [
    TraineeRoleModel(id: 0, name: 'Observed'),
    TraineeRoleModel(id: 1, name: 'Assisted'),
    TraineeRoleModel(id: 2, name: 'Performed'),
    TraineeRoleModel(id: 3, name: 'Simulated'),
  ];
  List<String> traineeDescList = [
    "On mannequins or models or virtual",
    "Performing a patient care or procedure with assistance from clinical supervisor",
    "Observing a clinician while performing patient care or procedure",
    "Performing patient care procedure under supervision without getting any assistance from a clinical supervisor",
  ];

  void _onTraineeChanged(TraineeRoleModel value) {
    setState(() {
      final index = traineeItems.indexWhere((item) => item.value == value);
      if (index != -1) {
        traineeItems[index].isSelected = !traineeItems[index].isSelected;
      }
    });
  }

  SettingModel? selectedSettingValue;
  List<SettingModel> settingList = [
    SettingModel(id: 0, name: 'Outpatient'),
    SettingModel(id: 1, name: 'Inpatient'),
    SettingModel(id: 2, name: 'Emergency Department'),
    SettingModel(id: 3, name: 'Intensive Care Unit'),
    SettingModel(id: 4, name: 'Operating Room'),
    SettingModel(id: 5, name: 'Other'),
  ];

  AttendingPhysicianModel? selectedPhysicianValue;
  final List<AttendingPhysicianModel> physicianItems = [
    AttendingPhysicianModel(
        id: 0,
        name: 'Ece',
        surname: 'Havancı',
        specialtyID: 1,
        ekoid: '',
        userType: 1),
    AttendingPhysicianModel(
        id: 1,
        name: 'Damla',
        surname: 'Alpakin',
        specialtyID: 1,
        ekoid: '',
        userType: 1),
    AttendingPhysicianModel(
        id: 2,
        name: 'Nilay',
        surname: 'Dizdaş',
        specialtyID: 1,
        ekoid: '',
        userType: 1),
  ];

  @override
  void initState() {
    traineeItems = traineeList
        .map((TraineeRoleModel e) => CheckBoxItem<TraineeRoleModel>(
              value: e,
              label: e.name,
            ))
        .toList();

    settingItems = settingList
        .map((SettingModel e) => RadioButtonItem<SettingModel>(
              value: e,
              label: e.name,
            ))
        .toList();

    super.initState();
  }

  void _onSettingChanged(SettingModel? value) {
    setState(() {
      selectedSettingValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Procedure Form",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              CustomDropdownButton<SpecialtyModel>(
                items: specialtyItems,
                value: selectedSpecialtyValue,
                hint: 'Select a specialty',
                onChanged: (value) {
                  setState(() {
                    selectedSpecialtyValue = value;
                  });
                },
                itemToString: (item) => item.description,
                itemToId: (item) => item.id,
              ),
              const SizedBox(height: 10),
              CustomDropdownButton<ProcedureModel>(
                items: procedureItems,
                value: selectedProcedureValue,
                hint: 'Select a Procedure',
                onChanged: (value) {
                  setState(() {
                    selectedProcedureValue = value;
                  });
                },
                itemToString: (item) => item.description,
                itemToId: (item) => item.id,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trainee's Role",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(),
                ],
              ),
              const SizedBox(height: 10),
              CustomCheckBoxGrid<TraineeRoleModel>(
                items: traineeItems,
                onItemChanged: _onTraineeChanged,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: traineeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      traineeList[index].name,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    title: Text(
                      traineeDescList[index],
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Setting",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(),
                ],
              ),
              const SizedBox(height: 10),
              CustomRadioButtonList<SettingModel>(
                items: settingItems,
                selectedValue: selectedSettingValue,
                onChanged: _onSettingChanged,
              ),
              const SizedBox(height: 10),
              CustomDropdownButton<AttendingPhysicianModel>(
                items: physicianItems,
                value: selectedPhysicianValue,
                hint: "Attending Physician",
                onChanged: (value) {
                  setState(() {
                    selectedPhysicianValue = value;
                  });
                },
                itemToString: (item) => '${item.name} ${item.surname}',
                itemToId: (item) => item.id!,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: _sent, child: const Text("Sent"))),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: _save, child: const Text("Save"))),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: _delete,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sent() {}

  void _save() {}

  void _delete() {}
}
