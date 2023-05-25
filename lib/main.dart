import 'package:flutter/material.dart';
import 'package:flutter_dignal_2023/providers/estados_provider.dart';
import 'package:flutter_dignal_2023/screens/estados_provider_screen.dart';
import 'package:flutter_dignal_2023/screens/estados_screen.dart';
import 'package:flutter_dignal_2023/screens/formularios_screen.dart';
import 'package:flutter_dignal_2023/screens/listview_screen.dart';
import 'package:flutter_dignal_2023/screens/mensajes_screen.dart';
import 'package:flutter_dignal_2023/screens/widgets_estructura_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EstadosProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const MyHomePage(title: 'Nueva ventana'),
        //home: ListviewScreen(),
        initialRoute: ListviewScreen.route,
        routes: {
          ListviewScreen.route: (context) => ListviewScreen(),
          WidgetsEstructuraScreen.route: (context) => WidgetsEstructuraScreen(),
          EstadosScreen.route: (context) => EstadosScreen(),
          EstadosProviderScreen.route: (context) => EstadosProviderScreen(),
          MensajesScreen.route: (context) => MensajesScreen(),
          FormulariosScreen.route: (context) => FormulariosScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clicks en pantalla:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
