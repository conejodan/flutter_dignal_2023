import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/models/models.dart';
import 'package:flutter_dignal_2023/services/my_server.dart';

class UsersProvider extends ChangeNotifier {
  UsersProvider() {
    getUsers();
  }

  late User selectedUser;
  // List<User> users = List.generate(
  //   16,
  //   (index) => User(
  //     id: index,
  //     name: 'User ${index + 1}',
  //     username: 'Username $index',
  //     active: Random().nextBool(),
  //   ),
  // );
  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  List<User> users = [];

  getUsers() async {
    print('getUsers');
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    final usersList = await MyServer().getUsers();
    _isLoading = false;
    notifyListeners();
    if (usersList == null) return null;
    users = usersList;
  }

  addUser(User user) {
    users.add(user);
    notifyListeners();
  }
}
