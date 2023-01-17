import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_login_page_hive/hive_registration/user_list.dart';
import 'package:new_login_page_hive/user_list_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserListAdapter());
  await Hive.openBox<UserList>('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListPage(),
    );
  }
}
