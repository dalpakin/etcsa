import 'package:etcsa/core/models/level_of_care.dart';
import 'package:etcsa/core/models/setting.dart';
import 'package:etcsa/core/models/tier.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/hospital.dart';
import '../../../../core/models/physician.dart';
import '../../../../core/models/specialty.dart';
import '../../../../core/models/trainee_role.dart';
import '../../common/char_limited_text_field.dart';
import '../../common/custom_dropdown_button.dart';
import '../../common/custom_multiple_checkbox.dart';
import '../../common/custom_radio_button.dart';

class AddPatientFormView extends StatefulWidget {
  static const route = '/add-patient-form-4-5';

  const AddPatientFormView({super.key});

  @override
  State<AddPatientFormView> createState() => _AddPatientFormViewState();
}

class _AddPatientFormViewState extends State<AddPatientFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _specialtyKey = GlobalKey<FormFieldState>();
  final ScrollController _scrollController = ScrollController();
  final _patientIDController = TextEditingController();
  final _illnessScriptController = TextEditingController();
  late List<CheckBoxItem<TraineeRoleModel>> traineeItems;
  late List<CheckBoxItem<LevelOfCareModel>> levelOfCareItems;
  late List<RadioButtonItem<SettingModel>> settingItems;

  final _tier1Controller = TextEditingController();
  final _tier2Controller = TextEditingController();
  final _tier3Controller = TextEditingController();
  final _tier4Controller = TextEditingController();

  SpecialtyModel? selectedSpecialtyValue;
  final List<SpecialtyModel> specialtyItems = [
    SpecialtyModel(1, 'Cardiology'),
    SpecialtyModel(2, 'Dermatology'),
    SpecialtyModel(3, 'Gastroenterology'),
    SpecialtyModel(4, 'Neurology'),
    SpecialtyModel(5, 'Oncology'),
  ];

  HospitalModel? selectedHospitalValue;
  final List<HospitalModel> hospitalItems = [
    HospitalModel(1, 'Emot'),
    HospitalModel(2, 'Medical Point'),
  ];

  List<TraineeRoleModel> traineeList = [
    TraineeRoleModel(id: 0, name: 'Observed'),
    TraineeRoleModel(id: 1, name: 'Assisted'),
    TraineeRoleModel(id: 2, name: 'Performed'),
    TraineeRoleModel(id: 3, name: 'Simulated'),
  ];

  List<LevelOfCareModel> levelOfCareList = [
    LevelOfCareModel(id: 0, name: 'History'),
    LevelOfCareModel(id: 1, name: 'Physical Examination'),
    LevelOfCareModel(id: 2, name: 'Treatment'),
    LevelOfCareModel(id: 3, name: 'Differential Diagnosis'),
  ];

  SettingModel? selectedSettingValue;
  List<SettingModel> settingList = [
    SettingModel(id: 0, name: 'Outpatient'),
    SettingModel(id: 1, name: 'Inpatient'),
    SettingModel(id: 2, name: 'Emergency Department'),
    SettingModel(id: 3, name: 'Intensive Care Unit'),
    SettingModel(id: 4, name: 'Operating Room'),
    SettingModel(id: 5, name: 'Other'),
  ];

  List<String> traineeDescList = [
    "On mannequins or models or virtual",
    "Performing a patient care or procedure with assistance from clinical supervisor",
    "Observing a clinician while performing patient care or procedure",
    "Performing patient care procedure under supervision without getting any assistance from a clinical supervisor",
  ];

  @override
  void initState() {
    super.initState();
    traineeItems = traineeList
        .map((TraineeRoleModel e) => CheckBoxItem<TraineeRoleModel>(
              value: e,
              label: e.name,
            ))
        .toList();

    levelOfCareItems = levelOfCareList
        .map((LevelOfCareModel e) => CheckBoxItem<LevelOfCareModel>(
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
  }

  void _onTraineeChanged(TraineeRoleModel value) {
    setState(() {
      final index = traineeItems.indexWhere((item) => item.value == value);
      if (index != -1) {
        traineeItems[index].isSelected = !traineeItems[index].isSelected;
      }
    });
  }

  void _onLevelOfCareChanged(LevelOfCareModel value) {
    setState(() {
      final index = levelOfCareItems.indexWhere((item) => item.value == value);
      if (index != -1) {
        levelOfCareItems[index].isSelected =
            !levelOfCareItems[index].isSelected;
      }
    });
  }

  void _onSettingChanged(SettingModel? value) {
    setState(() {
      selectedSettingValue = value;
    });
  }

  TierModel? selectedTier1Value;
  final List<TierModel> tier1Items = [
    TierModel(1, 'Abortus', null),
    TierModel(2, 'Gebelik', null),
    TierModel(3, 'Hidrosel', null),
  ];

  TierModel? selectedTier2Value;
  final List<TierModel> tier2Items = [
    TierModel(1, 'Abortus', null),
    TierModel(2, 'Gebelik', null),
    TierModel(3, 'Hidrosel', null),
  ];

  TierModel? selectedTier3Value;
  final List<TierModel> tier3Items = [
    TierModel(1, 'Abortus', null),
    TierModel(2, 'Gebelik', null),
    TierModel(3, 'Hidrosel', null),
  ];

  TierModel? selectedTier4Value;
  final List<TierModel> tier4Items = [
    TierModel(1, 'Abortus', null),
    TierModel(2, 'Gebelik', null),
    TierModel(3, 'Hidrosel', null),
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
  void dispose() {
    _patientIDController.dispose();
    _tier1Controller.dispose();
    _tier2Controller.dispose();
    _tier3Controller.dispose();
    _tier4Controller.dispose();
    _illnessScriptController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Patient Form",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              const SizedBox(height: 10),
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
              CustomDropdownButton<HospitalModel>(
                items: hospitalItems,
                value: selectedHospitalValue,
                hint: 'Select a hospital',
                onChanged: (value) {
                  setState(() {
                    selectedHospitalValue = value;
                  });
                },
                itemToString: (item) => item.name,
                itemToId: (item) => item.id,
              ),
              const SizedBox(height: 10),
              CharacterLimitedTextField(
                controller: _illnessScriptController,
              ),
              Text(
                "Ex: {name} is a {age} {gender} with a {relevant PMH, PSH, FH, SH, Meds} who represents with {key symptoms with semantic qualifiers}, {signs} and {data}",
                textAlign: TextAlign.justify,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 10),
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
                    "Level of Care",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(),
                ],
              ),
              const SizedBox(height: 10),
              CustomCheckBoxGrid<LevelOfCareModel>(
                items: levelOfCareItems,
                onItemChanged: _onLevelOfCareChanged,
              ),
              const SizedBox(height: 10),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Differential Diagnosis",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(),
                ],
              ),
              const SizedBox(height: 5),
              CustomDropdownButton<TierModel>(
                items: tier1Items,
                value: selectedTier1Value,
                hint: 'Tier I (very likely)',
                onChanged: (value) {
                  setState(() {
                    selectedTier1Value = value;
                  });
                },
                itemToString: (item) => item.description,
                itemToId: (item) => item.id,
              ),
              const SizedBox(height: 10),
              CustomDropdownButton<TierModel>(
                items: tier2Items,
                value: selectedTier2Value,
                hint: "Tier Ie (can't miss - emergency)",
                onChanged: (value) {
                  setState(() {
                    selectedTier2Value = value;
                  });
                },
                itemToString: (item) => item.description,
                itemToId: (item) => item.id,
              ),
              const SizedBox(height: 10),
              CustomDropdownButton<TierModel>(
                items: tier3Items,
                value: selectedTier3Value,
                hint: "Tier II (likely)",
                onChanged: (value) {
                  setState(() {
                    selectedTier3Value = value;
                  });
                },
                itemToString: (item) => item.description,
                itemToId: (item) => item.id,
              ),
              const SizedBox(height: 10),
              CustomDropdownButton<TierModel>(
                items: tier4Items,
                value: selectedTier4Value,
                hint: "Tier III (less likely)",
                onChanged: (value) {
                  setState(() {
                    selectedTier4Value = value;
                  });
                },
                itemToString: (item) => item.description,
                itemToId: (item) => item.id,
              ),
              const SizedBox(height: 30),
              const Divider(),
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
              const SizedBox(height: 10),
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
