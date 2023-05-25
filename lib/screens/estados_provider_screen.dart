import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/providers/estados_provider.dart';
import 'package:provider/provider.dart';

class EstadosProviderScreen extends StatelessWidget {
  const EstadosProviderScreen({super.key});

  static String route = "estados_provider";

  @override
  Widget build(BuildContext context) {
    return EstadoProviderScaffold();
  }
}

class EstadoProviderScaffold extends StatelessWidget {
  const EstadoProviderScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estados con Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EstadoTituloSeccion(),
            SwitchSeccion(),
          ],
        ),
      ),
    );
  }
}

class EstadoTituloSeccion extends StatelessWidget {
  const EstadoTituloSeccion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool activo = Provider.of<EstadosProvider>(context).activo;
    if (activo) {
      return Text('Activo');
    }
    return Text('Inactivo');
  }
}

class SwitchSeccion extends StatelessWidget {
  const SwitchSeccion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool activo = Provider.of<EstadosProvider>(context).activo;
    return Switch(
      value: activo,
      onChanged: (value) {
        Provider.of<EstadosProvider>(context, listen: false).activo = value;
      },
    );
  }
}
