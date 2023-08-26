import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/screens/app/screens.dart';
import 'package:flutter_dignal_2023/screens/bluetooth_screen.dart';
import 'package:flutter_dignal_2023/screens/cardio_screen.dart';
import 'package:flutter_dignal_2023/screens/estados_provider_screen.dart';
import 'package:flutter_dignal_2023/screens/estados_screen.dart';
import 'package:flutter_dignal_2023/screens/mensajes_screen.dart';
import 'package:flutter_dignal_2023/screens/widgets_estructura_screen.dart';
import 'package:flutter_dignal_2023/screens/formularios_screen.dart';

class ListviewScreen extends StatelessWidget {
  const ListviewScreen({super.key});

  static String route = '/';

  @override
  Widget build(BuildContext context) {
    double heigthContainer = 100;
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('click'),
              ),
              ListTile(
                title: Text('Elemento 1'),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Listviews'),
      ),
      body: ListView(
        //physics: BouncingScrollPhysics(),
        children: [
          /*
          Container(
            width: 100,
            height: heigthContainer,
            color: Colors.red,
          ),
          Container(
            width: 100,
            height: heigthContainer,
            color: Colors.blue,
          ),
          */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: heigthContainer,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          ListTile(
            //leading: Icon(Icons.alarm),
            title: Text('Widgets de Estructura'),
            subtitle: Text('Ejemplo de Widgets de estructura'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('Enviando a widgets de estructura');
              Navigator.pushNamed(context, WidgetsEstructuraScreen.route);
            },
            onLongPress: () => print('Long press'),
          ),
          ListTile(
            //leading: Icon(Icons.alarm),
            title: Text('Estados con Statefull'),
            subtitle: Text('Ejemplo de estados utilizando un stateful'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('Enviando a widgets de estructura');
              Navigator.pushNamed(context, EstadosScreen.route);
            },
            onLongPress: () => print('Long press'),
          ),
          ListTile(
            //leading: Icon(Icons.alarm),
            title: Text('Estados con Provider'),
            subtitle: Text('Ejemplo de estados utilizando un provider'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('Enviando a estados con provider');
              Navigator.pushNamed(context, EstadosProviderScreen.route);
            },
            onLongPress: () => print('Long press'),
          ),
          ListTile(
            //leading: Icon(Icons.alarm),
            title: Text('Mensajes/Alertas'),
            subtitle: Text('Ejemplo de mensajes y alertas'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, MensajesScreen.route);
            },
            onLongPress: () => print('Long press'),
          ),
          ListTile(
            //leading: Icon(Icons.alarm),
            title: Text('Formulario'),
            subtitle: Text('Ejemplo de formulario'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, FormulariosScreen.route);
            },
            onLongPress: () => print('Long press'),
          ),
          ListTile(
            //leading: Icon(Icons.alarm),
            title: Text('Bluetooth'),
            subtitle: Text('Ejemplo de bluetooth'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, BluetoothScreen.route);
            },
            onLongPress: () => print('Long press'),
          ),
          ListTile(
            //leading: Icon(Icons.alarm),
            title: Text('Cardio'),
            subtitle: Text('Ejemplo de Cardio'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, CardioScreen.route);
            },
            onLongPress: () => print('Long press'),
          ),
          ListTile(
            //leading: Icon(Icons.alarm),
            title: Text('DignalApp'),
            subtitle: Text('Aplicacion de Dignal'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, LoginScreen.route);
            },
            onLongPress: () => print('Long press'),
          ),
        ],
      ),
    );
  }
}
