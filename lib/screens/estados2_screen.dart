import 'package:flutter/material.dart';

class Estados2Screen extends StatefulWidget {
  const Estados2Screen({super.key});

  @override
  State<Estados2Screen> createState() => _Estados2ScreenState();
}

class _Estados2ScreenState extends State<Estados2Screen> {
  bool _activo = true;

  void _changeSwitchStatus(value) {
    setState(() {
      print("Valor del Switch");
      print(value);
      _activo = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statefull'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Activo'),
            Switch(
              value: _activo,
              onChanged: (value) {
                //activo = value;
                _changeSwitchStatus(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
