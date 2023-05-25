import 'package:flutter/material.dart';

class EstadosProvider with ChangeNotifier {
  bool _activo = true;

  bool get activo => _activo;

  set activo(bool value) {
    print("cambiando valor");
    print(value);
    _activo = value;
    notifyListeners();
  }

  String titulo = "";

  List<Map<String, String>> alumnos = [];
}
