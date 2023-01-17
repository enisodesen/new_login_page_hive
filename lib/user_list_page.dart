import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_login_page_hive/hive_registration/user_list.dart';
import 'package:new_login_page_hive/signup_list.dart';
import 'package:new_login_page_hive/widgets/custom_button.dart';
import 'package:new_login_page_hive/widgets/custom_text_field.dart';

class UserListPage extends StatelessWidget {
  UserListPage({super.key});

//Create TextField Controller

  final controllerName = TextEditingController(); // Değişken
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CustomTextField(
                    controller: controllerName,
                    hintText: 'Enter Your Name',
                    prefixIcon: Icons.person),
                CustomTextField(
                    controller: controllerUsername,
                    hintText: 'Enter Your Username',
                    prefixIcon: Icons.person_add_alt_rounded),
                CustomTextField(
                    controller: controllerPassword,
                    hintText: 'Create a password',
                    prefixIcon: Icons.lock),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        final myBox = Hive.box<UserList>('userBox');
                        myBox.add(UserList(
                            userName: controllerUsername.text,
                            password: controllerPassword.text));
                      },
                    ),
                    CustomButton(
                      text: 'Go',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupList(),
                            ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
