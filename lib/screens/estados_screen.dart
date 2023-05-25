import 'package:flutter/material.dart';

class EstadosScreen extends StatefulWidget {
  const EstadosScreen({super.key});

  static String route = "estados";

  @override
  State<EstadosScreen> createState() => _EstadosScreenState();
}

class _EstadosScreenState extends State<EstadosScreen> {
  bool _activo = false;

  void _changeSwitchStatus(value) {
    setState(() {
      print("Valor del Switch");
      print(value);
      _activo = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return EstadosScaffold(
      activo: _activo,
      onChangedSwitch: _changeSwitchStatus,
    );
  }
}

class EstadosScaffold extends StatelessWidget {
  final bool activo;
  final Function(bool)? onChangedSwitch;
  const EstadosScaffold({
    Key? key,
    required this.activo,
    this.onChangedSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statefull'),
      ),
      body: Center(
        child: EstadoSeccion1(
          activo: activo,
          onChangedSwitch: onChangedSwitch,
        ),
      ),
    );
  }
}

class EstadoSeccion1 extends StatelessWidget {
  const EstadoSeccion1({
    Key? key,
    required this.activo,
    this.onChangedSwitch,
  }) : super(key: key);

  final bool activo;
  final Function(bool)? onChangedSwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Activo'),
        Switch(
          value: activo,
          onChanged: (value) {
            //activo = value;
            onChangedSwitch!(value);
          },
        ),
      ],
    );
  }
}
