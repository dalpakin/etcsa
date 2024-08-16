import 'package:etcsa/main.dart';
import 'package:etcsa/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'components/common/choicer_radio_list_tile.dart';
import 'components/sign_in_components/icon_text_form_field.dart';

class SignInView extends StatefulWidget {
  static const route = '/sign-in';

  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _storage = const FlutterSecureStorage();
  bool isPressed = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ekoidController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  String _selectedChoice = 'Student';

  void _onChoiceChanged(String? newChoice) {
    setState(() {
      _selectedChoice = newChoice!;
    });
  }

  Future<void> _handleSubmit() async {
    setState(() {
      isPressed = true;
    });

    if (_formKey.currentState?.validate() ?? false) {
    } else {
      print('Form is not valid');
    }
    setState(() {
      isPressed = false;
    });

    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(HomeView.route, (route) => false);
  }

  @override
  void dispose() {
    ekoidController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.15),
                    child: Image.asset(
                      "assets/images/ieu_main_orange.png",
                      height: 100,
                    ),
                  ),
                  const Column(
                    children: [
                      Divider(
                        color: Color.fromRGBO(39, 71, 96, 1),
                        thickness: 15,
                      ),
                      Divider(
                        color: Color.fromRGBO(254, 107, 1, 0.8),
                        thickness: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset(
                      "assets/images/open_name_main_logo.png",
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: AnimatedChoiceWidget(
                      choice1: 'Student',
                      choice2: 'Attending Physician',
                      selectedChoice: _selectedChoice,
                      onChanged: _onChoiceChanged,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        IconTextFormField(
                          controller: ekoidController,
                          labelText: '',
                          hintText: 'Ekoid',
                          keyboardType: TextInputType.text,
                          icon: Icons.person,
                          isRequired: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                        IconTextFormField(
                          controller: passController,
                          keyboardType: TextInputType.visiblePassword,
                          labelText: '',
                          hintText: 'Password',
                          icon: Icons.password,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      child: isPressed
                          ? const CircularProgressIndicator(
                              color: Colors.white70,
                            )
                          : const Text('SIGN IN'),
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
}
