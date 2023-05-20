import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/screens/widgets_estructura_screen.dart';

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
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
