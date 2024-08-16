import '../view/components/add_form/patient_form/add_patient_form_view_4_5.dart';
import '../view/components/add_form/procedure_form/add_procedure_form_view_4_5.dart';
import '../view/components/dashboard/dashboard_view.dart';
import '../view/components/sent_form_list/patient/sent_form_list_view_patient.dart';
import '../view/components/sent_form_list/procedure/sent_form_list_view_procedure.dart';
import '../view/draft_form_list/patient_form/draft_form_list_view_patient.dart';
import '../view/draft_form_list/procedure_form/draft_form_list_view_procedure.dart';
import '../view/home_view.dart';
import '../view/sign_in.dart';

final routes = {
  SignInView.route: (context) => const SignInView(),
  HomeView.route: (context) => const HomeView(),
  AddPatientFormView.route: (context) => const AddPatientFormView(),
  AddProcedureFormView.route: (context) => const AddProcedureFormView(),
  DraftPatientFormListView.route: (context) => const DraftPatientFormListView(),
  DraftProcedureFormListView.route: (context) => const DraftProcedureFormListView(),
  PatientSentFormListView.route: (context) => const PatientSentFormListView(),
  ProcedureSentFormListView.route: (context) => const ProcedureSentFormListView(),
  DashboardView.route: (context) => const DashboardView(),
};
