import 'dart:io';

import 'package:etcsa/view/components/common/custom_navigation_bar.dart';
import 'package:etcsa/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/router.dart';
import 'view/components/add_form/patient_form/add_patient_form_view_4_5.dart';
import 'view/components/add_form/procedure_form/add_procedure_form_view_4_5.dart';
import 'view/components/dashboard/dashboard_view.dart';
import 'view/components/sent_form_list/patient/sent_form_list_view_patient.dart';
import 'view/components/sent_form_list/procedure/sent_form_list_view_procedure.dart';
import 'view/draft_form_list/patient_form/draft_form_list_view_patient.dart';
import 'view/draft_form_list/procedure_form/draft_form_list_view_procedure.dart';
import 'view/sign_in.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/izmirekonomi.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(39, 71, 96, 1)),
        useMaterial3: true,
      ),
      home: const Scaffold(body: SignInView()),
    );
  }
}

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyAppState2();
}

class _MyAppState2 extends State<MyApp2> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _changePage(int index, String? pageType) {
    if (index == 1) {
      //add form
      if (pageType == 'patient') {
        navigatorKey.currentState?.pushNamed(DraftPatientFormListView.route);
      } else if (pageType == 'procedure') {
        navigatorKey.currentState?.pushNamed(DraftProcedureFormListView.route);
      }
    } else if (index == 2) {
      //add form
      if (pageType == 'patient') {
        navigatorKey.currentState?.pushNamed(AddPatientFormView.route);
      } else if (pageType == 'procedure') {
        navigatorKey.currentState?.pushNamed(AddProcedureFormView.route);
      }
    } else if (index == 3) {
      //sent forms
      if (pageType == 'sent-patient') {
        navigatorKey.currentState?.pushNamed(PatientSentFormListView.route);
      } else if (pageType == 'sent-procedure') {
        navigatorKey.currentState?.pushNamed(ProcedureSentFormListView.route);
      }
    } else {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(39, 71, 96, 1)),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            _selectedIndex = index;
          },
          children: const [
            HomeView(),
            DraftPatientFormListView(),
            AddPatientFormView(),
            PatientSentFormListView(),
            DashboardView(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onSelect: _changePage,
        ),
      ),
    );
  }
}
