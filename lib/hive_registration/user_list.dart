import 'package:hive/hive.dart';

part 'user_list.g.dart';

@HiveType(typeId: 1)
class UserList {
  UserList({required this.userName, required this.password});
  @HiveField(0)
  String userName;

  @HiveField(1)
  String password;
}
