import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_login_page_hive/hive_registration/user_list.dart';

class SignupList extends StatefulWidget {
  const SignupList({super.key});

  @override
  State<SignupList> createState() => _SignupListState();
}

class _SignupListState extends State<SignupList> {
  late List<UserList> _users;

  @override
  void initState() {
    super.initState();
    _users = Hive.box<UserList>('userBox').values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            _users[index].userName,
          ),
          subtitle: Text(
            _users[index].password,
          ),
        ),
      ),
    );
  }
}
