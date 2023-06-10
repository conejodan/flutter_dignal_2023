import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

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
    await Future.delayed(Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var url = Uri.http('192.168.100.33:4902', '/api/users');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer ' + token!,
    });

    // 1.- Convertir el json que viene del servidor a un Map

    // 2.- convertir los datos de los usuarios a la clase de User

    // 3.- Agregar los modelos de usuario al provider de user

    _isLoading = false;
    notifyListeners();
  }

  addUser(User user) {
    users.add(user);
    notifyListeners();
  }
}
